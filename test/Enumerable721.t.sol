// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "forge-std/Test.sol";
import "../src/Enumerable721.sol";

contract NFTTest1 is Test {
    using stdStorage for StdStorage;

    Enumerable721 private nft;

    function setUp() public {
        // Deploy NFT contract
        nft = new Enumerable721();
    }

    function testMintAndTransfer() public {
        //Test amount of times
        uint256 times = 10;
        for (uint256 i = 0; i < times; i++) {
            nft.mint{value: 0.08 ether}();
        }
        //Tests Safe transfer feature
        nft.transfer(0x000000000000000000000000000000000000dEaD, 4);
        nft.transfer(0x000000000000000000000000000000000000dEaD, 5);
        nft.transfer(0x000000000000000000000000000000000000dEaD, 6);
    }

    function onERC721Received(
        address operator,
        address from,
        uint256 id,
        bytes calldata data
    ) external returns (bytes4) {
        return this.onERC721Received.selector;
    }
}
