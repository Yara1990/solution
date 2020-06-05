pragma solidity ^0.6.8;
import "@openzeppelin/contracts/access/Ownable.sol";
import "./PST.sol";
//only to edit on remix
// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Holding is Ownable {
// we can integrade ustd contract to send the fee
  struct Fee{
    uint fixedFee;
    uint varFee;
  }

  mapping (address => Fee) public  fees;
  address[] private tokens;
  mapping (address => uint) ownerToToken;

    function createToken(string memory _name,string memory _symbol,uint _initialSupply,address _owner) public payable onlyOwner {
      require(msg.value == 0.01*10e18,"Fixed fee is need to be paid for creating token");
      tokens.push(address(new PSTToken(_name,_symbol,_initialSupply,_owner)));
      ownerToToken[_owner] = tokens.length - 1;
      fees[_owner].fixedFee = msg.value;
    }

    function getAllTokens() view public onlyOwner returns (address[] memory) {
      return tokens;
    }

    function calculateVariableFee (address _tokenAddress) public {
      //TODO

    }

    function payvariablefee() public payable {
      //TODO
    }

}
