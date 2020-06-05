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
  // mapping (uint => address) public PSTToOwner;

    constructor(string memory _name,string memory _symbol,uint initialSupply,address _owner) ERC20(_name, _symbol) public {
        _mint(_owner, initialSupply);

    }

    //request to buy

    function reqToBuy(uint _price, uint _quantity) public {
      tradeRequest[msg.sender].price = _price;
      tradeRequest[msg.sender].quantity = _quantity;
      noOfRequest++;
      requesters.push(msg.sender);
    }

    function getAllRequesters() public view returns(address[] memory) {
      return requesters;
    }

    function getRequesterDetails(address _reqAddress) public view returns(uint price,uint quantity,bool status) {
      return (
        tradeRequest[_reqAddress].price,
        tradeRequest[_reqAddress].quantity,
        tradeRequest[_reqAddress].tradeStatus
      );
    }

    function acceptOffer(address _address) public {
      tradeRequest[_address].tradeStatus = true;
      transfer(_address,tradeRequest[_address].quantity);
    }



}
