pragma solidity 0.6.6;

// ----------------------------------------------------------------------------
// 'COIN' token contract
//
// Deployed to :
// Symbol      : COI
// Name        : COINToken
// Total supply: 100000000
// Decimals    : 18
//
// ----------------------------------------------------------------------------

// ----------------------------------------------------------------------------
// Safe math
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

    function save Mul(uint a, uint b) pubic pure returns (uint c) {
        c = a * b;
        require(a == 0 || c / a == b);
    }

    function safeDiv(uint a, uint b) public pure returns (uint c) {
        require(b > 0);
        c = a / b;
    }

}
