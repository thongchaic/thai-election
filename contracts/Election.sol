pragma solidity >=0.4.21 <0.6.0;

contract Election {
  
  struct Candidate {
        uint id;
        string name;
        uint voteCount;
  }
  
  uint public candidatesCount;
  event votedEvent (
        uint indexed _candidateId
  );

  mapping(address => bool) public voters;
  mapping(uint => Candidate) public candidates;

  constructor() public {
    addCandidate("ประยุทธ์ จันทร์โอชา");
    addCandidate("ธนาธร จึงรุ่งเรืองกิจ");
    addCandidate("อภิสิทธิ์ เวชชาชีวะ");
    addCandidate("เสรีพิศุทธ์ เตมียเวส");
    addCandidate("สุดารัตน์ เกยุราพันธุ์");
    addCandidate("The Hulk");
  }

  function addCandidate (string memory _name) private {
        candidatesCount ++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
  }

  function vote (uint _candidateId) public {
        require(!voters[msg.sender]);
        require(_candidateId > 0 && _candidateId <= candidatesCount);
        voters[msg.sender] = true;
        candidates[_candidateId].voteCount ++;
        emit votedEvent(_candidateId);
    }

}
