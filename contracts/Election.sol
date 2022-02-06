pragma solidity >=0.4.22 <0.8.0;

contract Election {
    struct candidate {
        uint256 id;
        string name;
        uint256 voteCount;
    }
    // Store accounts that have voted
    mapping(address => bool) public voters;
    // Store Candidates
    // Fetch Candidate
    mapping(uint256 => candidate) public candidates;
    // Store Candidates Count
    uint256 public candidatesCount;

    constructor() public {
        addCandidate("Sabu sir");
        addCandidate("Koshy sir");
    }

    function addCandidate(string memory _name) private {
        candidatesCount++;
        candidates[candidatesCount] = candidate(candidatesCount, _name, 0);
    }

    function vote(uint256 _candidateId) public {
        // require that they haven't voted before
        require(!voters[msg.sender]);

        // // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        voters[msg.sender] = true;
        candidates[_candidateId].voteCount++;
    }
}
