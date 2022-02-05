pragma solidity >=0.4.22 <0.8.0;

contract Election {
    struct candidate {
        uint256 id;
        string name;
        uint256 vote;
    }

    mapping(uint256 => candidate) public candidates;

    uint256 public candidatesCount;

    constructor() public {
        addCandidate("Sabu sir");
        addCandidate("Koshy sir");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = candidate(candidatesCount, _name, 0);
    }
}
