
// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract NFT is ERC721URIStorage {

    uint public tokenId; //token Id 
    string private _name; //token Name
    string private _symbol; //token Symbol

    /**
    * @dev Initializes the contract by setting a `name` and a `symbol` to the token collection.
    */
    constructor() ERC721 (string memory name, string memory symbol) public {
        _name = name;
        _symbol = symbol;
    }

    /**
    * @dev See {IERC721Metadata-name}.
    */
    function name() public view override returns (string memory) {
        return _name;
    }

    /**
    * @dev See {IERC721Metadata-symbol}.
    */
    function symbol() public view override returns (string memory) {
        return _symbol;
    }

    /**
    * @dev Increases the tokenId and mint the token againt the deployers address
    * and sets the token URI after that returns the token Id
    */
    function mint(string memory _tokenURI) external returns (uint){
        tokenId++;
        _safeMint(msg.sender, tokenId);
        _setTokenURI(tokenId, _tokenURI);
        return(tokenId);
    }
}