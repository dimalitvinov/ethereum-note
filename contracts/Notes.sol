pragma solidity ^0.4.11;

contract Notes {
  /*address owner;*/

  Note[] public notes;

  struct Note {
    bytes32 text;
    uint id;
  }
/*
  function Notes() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if (msg.sender != owner) { revert(); }
    _;
  }*/


  function addNote(bytes32 _text, uint _id) returns (bool success) {
    Note memory newNote;
    newNote.text = _text;
    newNote.id = _id;

    notes.push(newNote);
    return true;
  }

  function editNote(bytes32 newText, uint curId) returns(uint){
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

  function getNotes() constant returns (bytes32[], uint[]) {
    uint length = notes.length;
    bytes32[] memory texts = new bytes32[](length);
    uint[] memory ids = new uint[](length);

    for (uint i = 0; i < notes.length; i++) {
        Note memory currentNote;
        currentNote = notes[i];
        texts[i] = currentNote.text;
        ids[i] = currentNote.id;
    }

    return (texts, ids);
  }

  function removeNote(uint id) returns(uint) {
    uint length = notes.length;
     for (uint i = 0; i < length; i++){
      Note memory newNote;
      newNote = notes[i];

      if (newNote.id == id) {
        delete notes[i];

        if (i < length-1) {
          notes[i] = notes[length-1];
        }
        notes.length--;
      }
    }
    return id;
  }
}
