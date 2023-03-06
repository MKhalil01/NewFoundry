// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@wallst/contracts/standards/ERC721A.sol";

contract Vanilla721A is ERC721A {
    constructor() ERC721A("Token", "TKN") {}

    function mint(uint256 quantity) external payable {
        require(msg.value >= quantity * 0.08 ether, "Not enough ether");
        super._mint(msg.sender, quantity, "", true);
    }

    function transfer(address destination, uint256 token_ID) external payable {
        super._transfer(msg.sender, destination, token_ID);
    }
}
