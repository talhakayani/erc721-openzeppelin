// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract GenK is ERC721 {

    address private owner;
    uint tokenId = 11522;

    mapping(uint256 => string) metadata; 

    constructor () ERC721("GenK", "GTK") {
        owner = msg.sender;
    }

    function mintGenK (address mintingAddress,string memory metadataURI) public returns (uint256) {
        require(address(0) != mintingAddress, "Minter address is Zero Address");
        require(msg.sender == owner, "You're not allowed to mint the token");
        
        tokenId  += 1;

        super._mint(mintingAddress, tokenId);
        metadata[tokenId] = metadataURI;

        return tokenId;
    }
    
    function tokenURI(uint256 _tokenId) public view virtual override returns (string memory){ 
        require(super._exists(_tokenId), "ERC721: Call for non-existent token");
        return metadata[tokenId];
    }
}
