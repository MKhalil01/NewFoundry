// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract Vanilla721 is ERC721 {
    uint256 tokenId = 0;

    constructor() ERC721("Token", "TKN") {}

    function mint() external payable {
        require(msg.value >= 0.08 ether, "Not enough ether");
        _mint(msg.sender, tokenId);
        tokenId++;
    }

    function transfer(address destination, uint256 token_ID) external payable {
        _transfer(msg.sender, destination, token_ID);
    }
}
