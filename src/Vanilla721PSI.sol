pragma solidity ^0.8.0;

import "erc721psi/contracts/ERC721Psi.sol";

contract Vanilla721PSI is ERC721Psi {
    constructor() ERC721Psi("Token", "TKN") {}

    function mint(uint256 quantity) external payable {
        // _safeMint's second argument now takes in a quantity, not a tokenId. (same as ERC721A)
        require(msg.value >= quantity * 0.08 ether, "Not enough ether");
        super._mint(msg.sender, quantity);
    }

    function transfer(address destination, uint256 token_ID) external payable {
        super._transfer(msg.sender, destination, token_ID);
    }
}
