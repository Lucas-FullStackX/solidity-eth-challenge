// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract PokemonFactory {
    struct Ability {
        string name;
        string description;
    }
    struct Pokemon {
        uint256 id;
        string name;
        Ability[] abilities;
    }

    Pokemon[] private pokemons;
    event NewPokemon(Pokemon newPokemon);
    mapping(uint256 => address) public pokemonToOwner;
    mapping(address => uint256) ownerPokemonCount;

    function createPokemon(
        string memory _name,
        uint256 _id,
        Ability[] memory _abilities
    ) public {
        require(_id > 0, "Invalid ID");
        require(bytes(_name).length > 3, "Invalid name");
        pokemons.push();
        uint256 index = pokemons.length - 1;
        pokemons[index].id = _id;
        pokemons[index].name = _name;
        for (uint256 i = 0; i < _abilities.length; i++) {
            pokemons[index].abilities.push(_abilities[i]);
        }
        pokemonToOwner[_id] = msg.sender;
        ownerPokemonCount[msg.sender]++;
        emit NewPokemon(pokemons[index]);
    }

    function getAllPokemons() public view returns (Pokemon[] memory) {
        return pokemons;
    }

    function getResult() public pure returns (uint256 product, uint256 sum) {
        uint256 a = 1;
        uint256 b = 2;
        product = a * b;
        sum = a + b;
    }
}
