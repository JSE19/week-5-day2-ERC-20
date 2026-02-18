// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script} from "forge-std/Script.sol";
import {ERC_20} from "../src/ERC_20.sol";

contract ERC_20Script is Script {
    ERC_20 public erc_20;

    function setUp() public {}

    function run() public {
        vm.startBroadcast();

        erc_20 = new ERC_20();

        vm.stopBroadcast();
    }
}
