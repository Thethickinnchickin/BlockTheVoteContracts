// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/access/Ownable.sol";
// Uncomment this line to use console.log
// import "hardhat/console.sol";

contract VotingList is Ownable {
    // Max number of voting allowed
    uint16 public maxVoters;

    // Create a mapping of voters
    // if an address is whitelisted, we would set it to true, it is false by default for all other addresses.
    mapping(address => bool) public votingAddresses;
    

    // numAddressesWhitelisted would be used to keep track of how many addresses have been whitelisted
    // NOTE: Don't change this variable name, as it will be part of verification
    uint16 public numVoters;

    // Setting the Max number of whitelisted addresses
    // User will put the value at the time of deployment
    constructor(uint16 _maxVoters) {
        maxVoters =  _maxVoters;
    }

    /**
        addAddressToWhitelist - This function adds the address of the sender to the
        whitelist
     */
    function addAddressToVoters() public {
        // check if the user has already been whitelisted
        require(!votingAddresses[msg.sender], "Sender has already on the voter registry");
        // check if the numAddressesWhitelisted < maxWhitelistedAddresses, if not then throw an error.
        require(numVoters < maxVoters, "More addresses cant be added, limit reached");
        // Add the address which called the function to the whitelistedAddress array
        votingAddresses[msg.sender] = true;
        // Increase the number of whitelisted addresses
        numVoters+= 1;
    }


}
