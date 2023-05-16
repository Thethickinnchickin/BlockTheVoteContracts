// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

interface IVotingList {
    function votingAddresses(address) external view returns (bool);
}