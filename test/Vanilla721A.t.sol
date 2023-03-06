pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC721/IERC721Receiver.sol";
import "forge-std/Test.sol";
import "../src/Vanilla721A.sol";

contract NFTTest4 is Test {
    using stdStorage for StdStorage;

    Vanilla721A private nft;

    function setUp() public {
        // Deploy NFT contract
        nft = new Vanilla721A();
    }

    function testMintAndTransfer() public {
        //Test amount of times
        uint256 times = 10;
        nft.mint{value: times * 0.08 ether}(times);
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
