// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import {ERC721} from "openzeppelin-contracts/contracts/token/ERC721/ERC721.sol";
import {ERC721Enumerable} from "openzeppelin-contracts/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import {Ownable} from "openzeppelin-contracts/contracts/access/Ownable.sol";

contract NandikaNFT is ERC721, Ownable {
    uint256 private _nextTokenId;
    string public baseURI;

    constructor() ERC721("NFTFromNandika", "NDT") Ownable(msg.sender) {}

    function MintNFT() public {
        uint256 tokenId = _nextTokenId++; // ID = 1
        _safeMint(msg.sender, tokenId);
    }

    function setBaseURI(string calldata _tokenBaseURI) external onlyOwner {
        baseURI = _tokenBaseURI;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURI;
    }
}