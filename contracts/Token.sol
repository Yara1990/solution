pragma solidity ^0.6.0;

// import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
// import "@openzeppelin/contracts/utils/Counters.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC721/ERC721.sol";
import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/Counters.sol";



contract Token is ERC721 {
  struct Token{
    address current_Owner,
    uint value
  }

  PST[] public psts;

 mapping (uint => address) public PSTToOwner;
 mapping (address => uint) ownerPSTCount;


  using Counters for Counters.Counter;
  Counters.Counter private _tokenIds;
  uint value = 0;

    constructor(string memory _name,string memory _symbol, uint _value) ERC721(_name,_symbol) public {
      value = _value;

    }

    function awardItem(address player, string memory tokenURI) public returns (uint256) {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(player, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }


}
