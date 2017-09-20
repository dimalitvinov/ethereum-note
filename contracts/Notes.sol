pragma solidity ^0.4.11;

contract Notes {
  address public owner = msg.sender;

  Note[] public notes;

  modifier onlyOwner() {
    if (msg.sender == owner) {
      _;
    }
  }

  struct Note {
    uint id;
    bytes32 text;
  }

  function addNote(uint _id, bytes32 _text) onlyOwner() returns (bool success) {
    Note memory newNote;
    newNote.text = _text;
    newNote.id = _id;

    notes.push(newNote);
    return true;
  }

  function editNote(uint curId, bytes32 newText) returns(uint){
    for (uint i = 0; i < notes.length; i++){
      Note memory newNote;
      newNote = notes[i];

      if (newNote.id == curId) {
        newNote.text = newText;
        notes[i] = newNote;
      }
    }
    return curId;
  }

  function getNotes() constant returns (uint[], bytes32[]) {
    uint length = notes.length;
    bytes32[] memory texts = new bytes32[](length);
    uint[] memory ids = new uint[](length);

    for (uint i = 0; i < notes.length; i++) {
        Note memory currentNote;
        currentNote = notes[i];
        texts[i] = currentNote.text;
        ids[i] = currentNote.id;
    }

    return (ids, texts);
  }

  function removeNote(uint id) returns(uint) {
     for (uint i = 0; i < notes.length; i++){
      Note memory newNote;
      newNote = notes[i];

      if (newNote.id == id) {
        delete notes[i];

        if (i < notes.length-1) {
          notes[i] = notes[notes.length-1];
        }
        notes.length--;
      }
    }
    return id;
  }
}
