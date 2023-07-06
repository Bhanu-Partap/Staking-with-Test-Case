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
    mapping(address => uint256) public balances;

    event tokensStaked(address from, uint256 amount, uint duration);


    
    function staking(uint _amount, string memory _type) public returns(string memory){
        Stake_details[msg.sender].stake_amount = _amount;
        Stake_details[msg.sender].stake_type = _type;
        Stake_details[msg.sender].stake_time = block.timestamp;
        if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("fixed_staking"))){
            Token.transferFrom(msg.sender, address(this), _amount);
            balances[msg.sender] = balances[msg.sender]+_amount;
            emit tokensStaked(msg.sender, _amount,block.timestamp );

        }

        else if(keccak256(abi.encodePacked(_type)) == keccak256(abi.encodePacked("unfixed_staking"))){
            // Stake_details[msg.sender].stake_amount = _amount;
            // Stake_details[msg.sender].stake_type = _type;
            Token.transferFrom(msg.sender, address(this), _amount);
            balances[msg.sender] = balances[msg.sender]+_amount;
            emit tokensStaked(msg.sender, _amount);

        }
    }

    // function unstaking()public returns(string memory){

    // }



}