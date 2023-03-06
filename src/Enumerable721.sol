// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";

contract Enumerable721 is ERC721Enumerable {
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
