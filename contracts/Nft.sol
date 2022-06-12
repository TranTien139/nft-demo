// SPDX-License-Identifier: MIT
pragma solidity 0.8.3;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract Nft is ERC721, Ownable {
    using Strings for uint256;
    string public baseURI = "https://raw.githubusercontent.com/TranTien139/nft-demo/master/cards/";
    uint256 public nftId = 0;
    address public operator;

    constructor() ERC721("NFT Demo", "NFTD") {
        operator == msg.sender;
    }

    // https://raw.githubusercontent.com/TranTien139/nft-demo/master/cards/1.json
    function tokenURI(uint256 tokenId) public view virtual override returns (string memory) {
        require(_exists(tokenId), "ERC721Metadata: URI query for nonexistent token");
        string memory buri = baseURI;
        return bytes(buri).length > 0
            ? string(abi.encodePacked(buri, tokenId.toString(), ".json"))
            : '';
    }

    function mint(address to) public onlyOwner {
        _mint(to, nftId);
        nftId++;
    }

    function getTotalNft() view public returns(uint){
        return nftId;
    }

    function setBaseUri(string memory tokenUri) public onlyOwner {
        require(bytes(tokenUri).length > 0, "tokenUri required");
        baseURI = tokenUri;
    }

}
