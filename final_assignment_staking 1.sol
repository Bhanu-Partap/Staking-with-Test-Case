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


}