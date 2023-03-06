// SPDX-License-Identifier: MIT
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "forge-std/Script.sol";
import "../src/Vanilla721A.sol";

contract NFTScript4 is Script {
    Vanilla721A private nft;

    function run() public {
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");
        vm.startBroadcast(deployerPrivateKey);
        // Deploy NFT contract
        nft = new Vanilla721A();
        //Test amount of times
        uint256 times = 10;
        nft.mint{value: times * 0.08 ether}(times);
        //Tests Safe transfer feature
        nft.transfer(0x000000000000000000000000000000000000dEaD, 4);
        nft.transfer(0x000000000000000000000000000000000000dEaD, 5);
        nft.transfer(0x000000000000000000000000000000000000dEaD, 6);
        vm.stopBroadcast();
    }
}
