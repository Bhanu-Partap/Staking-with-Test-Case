// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Staking {

    ERC20Basic Token;

     constructor(ERC20Basic _addressERC20 ){
        Token=_addressERC20;
    }
    
    struct Stake{
        uint stake_amount;
        uint stake_reward;
        string stake_type;
        uint stake_time;
    }
    
    address mapping_address;

    mapping(address =>Stake) public Stake_details;
    
    function staking(uint _amount, string memory _type) public returns(string memory){
        Stake_details[msg.sender].stake_amount = _amount;
        Stake_details[msg.sender].stake_type = _type;
        Stake_details[msg.sender].stake_time = block.timestamp;
        if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("fixed_staking"))){

        }

        else if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("unfixed_staking"))){

        }
        


    }

    function unstaking()public returns(string memory){

    }



}