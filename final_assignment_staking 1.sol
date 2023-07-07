// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "./ERC-20.sol";

contract Staking_Token {

    ERC20Basic Token;

     constructor(ERC20Basic _addressERC20 ){
        Token=_addressERC20;
    }

    struct Stake{
        uint stake_amount;
        string stake_type;
        uint stake_time;
    }

    address mapping_address;
    uint stake_reward;


    mapping(address =>Stake) public Stake_details;
    // mapping(address => uint256) public balances;


    event tokensStaked(address from, uint256 amount, uint _duration);


    function staking(uint _amount, string memory _type, uint _duration) public  {
        require(Token.balanceOf(msg.sender)>=_amount,"Insufficient Balance");
        if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("fixed"))){
            // require(_amount >0," Stake can not be 0 , Enter some amount of tokens");
            Stake_details[msg.sender].stake_amount = _amount;
            Stake_details[msg.sender].stake_time = block.timestamp + _duration;
        Token.transferFrom(msg.sender, address(this), _amount);
        emit tokensStaked(msg.sender, _amount, block.timestamp);

        }

        else if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("unfixed"))){
            Stake_details[msg.sender].stake_amount = _amount;
        }
    

    }

    function unstaking()public returns(string memory){

    }

 function getcontractaddress() public returns(address){
      return address(this);
      }

}


