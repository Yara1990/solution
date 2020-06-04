pragma solidity ^0.6  .0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PSTToken is ERC20 {

  // mapping (uint => address) public PSTToOwner;

    constructor(string memory _name,string memory _symbol,uint initialSupply,address _owner) ERC20(_name, _symbol) public {
        _mint(_owner, initialSupply);

    }
}
