// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface IMyNFT {
    function mintNFT(address recipient, string memory tokenURI) external returns (uint256);
    function ownerOf(uint256 tokenId) external view returns (address);
    function tokenURI(uint256 tokenId) external view returns (string memory);
    function safeTransferFrom(address from, address to, uint256 tokenId) external;
}
