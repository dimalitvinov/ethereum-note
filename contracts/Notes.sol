pragma solidity ^0.4.11;

/*import "./structures.sol";*/

contract Notes {
  /*mapping (bytes32 => bytes32) basic_data;*/
  /*address owner;*/

  Note[] public notes;

  struct Note {
    bytes32 text;
  }
/*
  function Notes() {
    owner = msg.sender;
  }

  modifier onlyOwner() {
    if (msg.sender != owner) { revert(); }
    _;
  }*/

  /*function setBasicData (bytes32 key, bytes32 value) onlyOwner() {
    basic_data[key] = value;
  }*/
  /*function getBasicData (bytes32 arg) constant returns (bytes32) {
    return basic_data[arg];
  }*/

  function addNote (bytes32 _text) returns (bool success) {
    Note memory newNote;
    newNote.text = _text;

    notes.push(newNote);
    return true;
  }

  function getNotes() constant returns (bytes32[]) {
    uint length = notes.length;
    bytes32[] memory texts = new bytes32[](length);

    for (uint i = 0; i < notes.length; i++) {
        Note memory currentNote;
        currentNote = notes[i];
        texts[i] = currentNote.text;
    }

    return (texts);
  }



  /*function editNote (bool operation, bytes32 text) onlyOwner() {
    if (operation) {
      notes.push(Structures.Note(text));
    } else {
      delete notes[notes.length - 1];
    }
  }

  function getSize(bytes32 arg) constant returns (uint) {
    if (sha3(arg) == sha3("notes")) { return notes.length; }
    revert();
  }*/
}
