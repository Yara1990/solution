pragma solidity ^0.6.8;
// import "@openzeppelin/contracts/access/Ownable.sol";
// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "./Token.sol";
import "./PST.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/access/Ownable.sol";


contract Holding is Ownable  {

  address[] private tokens ;

    function createToken(string memory _name,string memory _symbol,uint _initialSupply,address _owner) public onlyOwner {

     tokens.push(address(new PST(_name,_symbol,_initialSupply,_owner.)));
    }

    function getAllTokens() view public onlyOwner returns (address[] memory) {
      return tokens;
    }

}
