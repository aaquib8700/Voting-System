// SPDX-License-Identifier: MIT
pragma solidity >=0.5.0 <0.9.0;

contract VoterSystem {
    string[] public candidates;

    mapping(string => uint) private votecounter;
    mapping(address => mapping(string => bool)) private hasVoted;

    function addCandidates(string memory _candidate) public {
        candidates.push(_candidate);
    }

    function vote(string memory _candidate) public {
        require(!hasVoted[msg.sender][_candidate], "You have already voted for this candidate");
        votecounter[_candidate]++;
        hasVoted[msg.sender][_candidate] = true;
    }


    function totalVotes(string memory _candidate) public view returns (uint) {
        return votecounter[_candidate];
    }
}
