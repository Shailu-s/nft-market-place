# NFT Marketplace

A decentralized marketplace for buying, selling, and minting NFTs using the TrikonToken (TKT) ERC-20 token.

## Table of Contents

- [Introduction](#introduction)
- [Prerequisites](#prerequisites)
- [Getting Started](#getting-started)
- [Usage](#usage)
- [Contracts](#contracts)
- [Contributing](#contributing)
- [License](#license)

## Introduction

This project consists of a set of Solidity smart contracts that together create a decentralized marketplace for non-fungible tokens (NFTs). Users can mint NFTs, list them for sale, and buy NFTs from other users using the custom TrikonToken (TKT) ERC-20 token.

## Prerequisites

Before you begin, ensure you have met the following requirements:

- Node.js and npm (Node Package Manager) installed.
- Hardhat or a similar Ethereum development environment set up.
- The Truffle or OpenZeppelin library for Ethereum smart contract development.
- Access to an Ethereum network or a local Ethereum development network (e.g., Ganache).

## Getting Started

1. Clone the repository:

   ```bash
   git clone https://github.com/yourusername/nft-marketplace.git
   cd nft-marketplace
    npm install```

2. Configure your Ethereum development environment and network settings in the project.
3. Compile the smart contracts:
     npx hardhat compile
4. Deploy the smart contracts to your chosen Ethereum network:
    npx hardhat run scripts/deploy.js --network <your_network>
5. Update the contract addresses and ABI in the frontend application or any other client application that interacts with the marketplace.

## Usage
Minting NFTs: Only the contract owner can mint new NFTs using the mintNFT function.

Listing NFTs for Sale: Users can list their NFTs for sale using the listNFT or sellNFT function by specifying the NFT token ID and the desired price.

Buying NFTs: Users can buy NFTs listed for sale using the buyNFT function by specifying the NFT token ID and sending the required amount of TKT tokens.

Delisting NFTs: Users can delist their NFTs from the marketplace using the delistNFT function.

## Contracts
TrikonToken.sol: ERC-20 token contract representing the TrikonToken (TKT).

MyNFT.sol: ERC-721 token contract representing the NFTs.

NFTMarketplace.sol: Marketplace contract for buying, selling, and minting NFTs.

## Contributing
Contributions to this project are welcome. You can contribute by submitting bug reports, feature requests, or pull requests. Please read the Contributing Guidelines for more details.

## License
This project is licensed under the MIT License - see the LICENSE file for details.