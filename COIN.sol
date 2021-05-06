pragma solidity 0.6.6;

// ----------------------------------------------------------------------------
// 'COIN' token contract
//
// Deployed to :
// Symbol      : COIN
// Name        : COIN Token
// Total supply: 100000000
// Decimals    : 18
//
// ----------------------------------------------------------------------------

contract SafeMath {

    function safeAdd(uint a, uint b) public pure returns (uint c) {
        c = a + b;
        require(c >= a);
    }

    function safeSub(uint a, uint b) public pure returns (uint c) {
        require(b <= a);
        c = a - b;
    }

    function save Mul(uint a, uint b) public pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }

}


//Implement the ERC Token Standard Interface

abstract contract ERC20Interface {
      function totalSupply() virtual public view returns (uint balance);
      function balanceOf(address owner) virtual public view returns (uint remaining);
      function allowance(address owner, address spender) virtual public view returns (uint remaining);
      function transfer(address to, uint tokens) virtual public view returns (bool success);
      function approve(address spender, uint tokens) virtual public view returns (bool success);
      function transferFrom(address from, address to, uint tokens) virtual public view returns (bool success);

      event Transfer(address indexed from, address indexed to, uint tokens);
      event Approval(address indexed owner, address indexed spender, uint tokens);
}

// Contract to receive approval and execute function in one call

abstract contract ApproveAndCallFallBack {
      function receiveApproval(address from, uint256 tokens, address token, bytes memory data) virtual public;
}

// Ownership

contract Owned {
      address public owner;
      address public newOwner;

      event OwnershipTransferred(address indexed _from, address indexed _to);

      constructor() public {
          owner = msg.sender;
      }

      modifier onlyOwner {
          require(msg.sender == owner);
          _;
      }

      function transferOwnership(address _newOwner) public onlyOwner {
          newOwner = _newOwner;
      }

      function acceptOwnership() public {
          require(msg.sender == newOwner);
          emit OwnershipTransferred(owner, newOwner);
          owner = newOwner;
          newOwner = address(0);
      }
}

// Token

contract COINToken is ERC20Interface, Owned, SafeMath {
      string public symbol;
      string public name;
      uint8 public decimals;
      uint public _totalSupply;

      mapping(address => uint) balances;
      mapping(address => mapping(address => uint)) allowed;

      constructor() public {
          symbol = "COIN";
          name = "COIN Token";
          decimals = 0;
          _totalSupply = 100000000;
          balances['insert address here'] = _totalSupply;
          emit Transfer(address(0), 'insert address here', _totalSupply);
      }

      // Total Supply
      function totalSupply() public override view returns (uint) {
          return _totalSupply - balance[address(0)];
      }

      // Get the token balance for account tokenOwner
      function balanceOf(address tokenOwner) public override view returns (uint balance) {
          return balances[tokenOwner];
      }

      // --------------------------------
      // Transfer the balance from token owner's account to 'to' account
      // - owner's account must have sufficient balance to transfer
      // - 0 value transfers are allowed
      // --------------------------------
      function transfer(address to, uint tokens) public override returns (bool success) {
          balances[msg.sender] = safeSub(balances[msg.sender], tokens);
          balances[to] = safeAdd(balances[to], tokens);
          emit Transfer(msg.sender, to, tokens);
          return true;
      }
}
