pragma solidity ^0.6.0;

// import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract PSTToken is ERC20 {

  struct Trade{
    uint price;
    uint quantity;
    bool tradeStatus;
  }
  uint noOfRequest =0;

mapping (address => Trade) tradeRequest;
address[] public requesters;
address tokenOwner;
modifier onlyPSTOwner() {
    require(tokenOwner == msg.sender,'Only token ownercan call this function');
    _;
}
    constructor(string memory _name,string memory _symbol,uint initialSupply,address _owner) ERC20(_name, _symbol) public {
        _mint(_owner, initialSupply);
        tokenOwner = _owner;

    }

    //request to buy

    function reqToBuy(uint _price, uint _quantity) public {
      tradeRequest[msg.sender].price = _price;
      tradeRequest[msg.sender].quantity = _quantity;
      noOfRequest++;
      requesters.push(msg.sender);
    }

    function getAllRequesters() public view onlyPSTOwner returns(address[] memory) {
      return requesters;
    }

    function getRequesterDetails(address _reqAddress) public view onlyPSTOwner returns(uint price,uint quantity,bool status) {
      return (
        tradeRequest[_reqAddress].price,
        tradeRequest[_reqAddress].quantity,
        tradeRequest[_reqAddress].tradeStatus
      );
    }


// a
    function acceptOffer(address _address) public onlyPSTOwner {
      tradeRequest[_address].tradeStatus = true;
      transfer(_address,tradeRequest[_address].quantity);
    }



}
