// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract NFTMarketplace is Ownable {
    IERC20 public trikonToken;
    IERC721 public nft;

    constructor(address _trikonToken, address _nft) {
        trikonToken = IERC20(_trikonToken);
        nft = IERC721(_nft);
    }

    struct Listing {
        uint256 tokenId;
        uint256 price;
        address seller;
        bool active;
    }

    mapping(uint256 => Listing) public listings;

    event NFTListed(uint256 indexed tokenId, uint256 price, address indexed seller);
    event NFTSold(uint256 indexed tokenId, uint256 price, address indexed buyer, address indexed seller);

    function listNFTForSell(uint256 tokenId, uint256 price) external {
        require(nft.ownerOf(tokenId) == msg.sender, "You don't own this NFT");
        require(!listings[tokenId].active, "NFT is already listed");
        
        listings[tokenId] = Listing({
            tokenId: tokenId,
            price: price,
            seller: msg.sender,
            active: true
        });

        emit NFTListed(tokenId, price, msg.sender);
    }

    function buyNFT(uint256 tokenId) external {
        Listing storage listing = listings[tokenId];
        require(listing.active, "NFT is not listed for sale");
        
        uint256 price = listing.price;
        address seller = listing.seller;
        
        require(trikonToken.transferFrom(msg.sender, seller, price), "Failed to transfer tokens");
        nft.safeTransferFrom(seller, msg.sender, tokenId);
        listing.active = false;

        delistNFT(tokenId);
        emit NFTSold(tokenId, price, msg.sender, seller);
    }

    function delistNFT(uint256 tokenId) public {
        Listing storage listing = listings[tokenId];
        require(listing.active, "NFT is not listed for sale");
        require(nft.ownerOf(tokenId) == msg.sender || msg.sender == listing.seller, "You don't have permission");
        listing.active = false;
    }
}
