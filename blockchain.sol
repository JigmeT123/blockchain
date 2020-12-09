pragma solidity >=0.5.0 <0.6.0;

contract PersonFactory{
    uint dnaDigits = 16;
    uint dnaModulus = 10 ** dnaDigits;
    
    struct Person{
        string name;
        uint dna;
    }
    
    Person[] public persons; 
    
    function _createPerson(string memory _name, uint _dna) private{
        persons.push(Person(_name, _dna));
        
    }
    
    function _generateRandomDna(string memory _name) private view returns (uint){
        uint rand = uint(keccak256(abi.encodePacked(_name)));
        return rand % dnaModulus;
    }
    function createRandomPerson(string memory _name) public{
        uint dna = _generateRandomDna(_name);
        _createPerson(_name, dna);
    }
    
}
