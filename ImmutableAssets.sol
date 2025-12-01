// SPDX-License-Identifier: MIT AND Apache-2.0
pragma solidity ^0.8.19;

import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

/**
 * @title Immutable Assets - V1.0.0 (Beta Template)
 * @author The Society
 * @notice This is a proof-of-concept template for on-chain intellectual property ownership.
 * @dev This contract allows creators to mint ideas with timestamped proof of ownership.
 *      No fees. Public good. Use this to test the Immutable Assets standard.
 * 
 * Features:
 * - Mint ideas with required metadata (name, description, category, status, version)
 * - Version number can be updated by creator
 * - All other fields are immutable after minting
 * - Tagged with "The Society" and "Immutable Assets" for ecosystem tracking
 * 
 * GitHub: [Your GitHub URL here]
 * Documentation: [Your docs URL here]
 */
contract ImmutableAssets is ERC721URIStorage, Ownable {
    
    // ============================================
    // STATE VARIABLES
    // ============================================
    
    uint256 private _tokenIdCounter;
    
    // Valid categories for ideas
    enum Category {
        SocialImpact,
        Technology,
        ArtAndCulture,
        Community,
        Research,
        Business,
        Education,
        HealthAndWellness,
        EnvironmentAndSustainability,
        FinanceAndEconomics,
        Infrastructure,
        Entertainment,
        FoodAndAgriculture,
        Other
    }
    
    // Valid statuses for ideas
    enum Status {
        Concept,
        InDevelopment,
        Completed,
        Archived
    }
    
    // Idea metadata structure
    struct IdeaMetadata {
        string name;
        string description;
        Category category;
        Status status;
        string version;
        string externalLink;
        address creator;
        uint256 timestamp;
    }
    
    // Mapping from token ID to metadata
    mapping(uint256 => IdeaMetadata) private _ideaMetadata;
    
    // ============================================
    // EVENTS
    // ============================================
    
    event IdeaMinted(
        uint256 indexed tokenId,
        address indexed creator,
        string name,
        Category category,
        uint256 timestamp
    );
    
    event VersionUpdated(
        uint256 indexed tokenId,
        string oldVersion,
        string newVersion
    );
    
    // ============================================
    // CONSTRUCTOR
    // ============================================
    
    constructor() ERC721("Immutable Assets", "IDEA") Ownable(msg.sender) {}
    
    // ============================================
    // CORE FUNCTIONS
    // ============================================
    
    /**
     * @notice Mint a new idea NFT with required metadata
     * @param name The name/title of the idea
     * @param description Detailed description of the idea
     * @param category Category enum (0-13)
     * @param status Status enum (0-3)
     * @param version Version number (e.g., "1.0.0")
     * @param externalLink URL for additional information
     */
    function mintIdea(
        string memory name,
        string memory description,
        Category category,
        Status status,
        string memory version,
        string memory externalLink
    ) public returns (uint256) {
        require(bytes(name).length > 0, "Name cannot be empty");
        require(bytes(description).length > 0, "Description cannot be empty");
        require(bytes(version).length > 0, "Version cannot be empty");
        
        uint256 newTokenId = _tokenIdCounter + 1;
        _tokenIdCounter = newTokenId;
        
        // Store metadata
        _ideaMetadata[newTokenId] = IdeaMetadata({
            name: name,
            description: description,
            category: category,
            status: status,
            version: version,
            externalLink: externalLink,
            creator: msg.sender,
            timestamp: block.timestamp
        });
        
        // Mint NFT to creator
        _safeMint(msg.sender, newTokenId);
        
        emit IdeaMinted(newTokenId, msg.sender, name, category, block.timestamp);
        
        return newTokenId;
    }
    
    /**
     * @notice Update the version number of an idea (creator only)
     * @param tokenId The ID of the idea NFT
     * @param newVersion The new version number
     */
    function updateVersion(uint256 tokenId, string memory newVersion) public {
        require(_exists(tokenId), "Token does not exist");
        require(msg.sender == _ideaMetadata[tokenId].creator, "Only creator can update version");
        require(bytes(newVersion).length > 0, "Version cannot be empty");
        
        string memory oldVersion = _ideaMetadata[tokenId].version;
        _ideaMetadata[tokenId].version = newVersion;
        
        emit VersionUpdated(tokenId, oldVersion, newVersion);
    }
    
    // ============================================
    // VIEW FUNCTIONS
    // ============================================
    
    /**
     * @notice Get complete metadata for an idea
     * @param tokenId The ID of the idea NFT
     */
    function getIdeaMetadata(uint256 tokenId) public view returns (IdeaMetadata memory) {
        require(_exists(tokenId), "Token does not exist");
        return _ideaMetadata[tokenId];
    }
    
    /**
     * @notice Get the total number of ideas minted
     */
    function totalIdeas() public view returns (uint256) {
        return _tokenIdCounter;
    }
    
    /**
     * @notice Contract metadata for platforms (includes tracking tags)
     */
    function contractURI() public pure returns (string memory) {
        return string(abi.encodePacked(
            '{"name":"Immutable Assets","description":"Beta template for on-chain intellectual property ownership. Part of The Society ecosystem.","external_link":"https://your-site.com","standard":"Immutable Assets","platform":"The Society","contract_version":"1.0.0","template":true}'
        ));
    }
    
    /**
     * @notice Helper function to convert Category enum to string
     */
    function getCategoryString(Category category) public pure returns (string memory) {
        if (category == Category.SocialImpact) return "Social Impact";
        if (category == Category.Technology) return "Technology";
        if (category == Category.ArtAndCulture) return "Art & Culture";
        if (category == Category.Community) return "Community";
        if (category == Category.Research) return "Research";
        if (category == Category.Business) return "Business";
        if (category == Category.Education) return "Education";
        if (category == Category.HealthAndWellness) return "Health & Wellness";
        if (category == Category.EnvironmentAndSustainability) return "Environment & Sustainability";
        if (category == Category.FinanceAndEconomics) return "Finance & Economics";
        if (category == Category.Infrastructure) return "Infrastructure";
        if (category == Category.Entertainment) return "Entertainment";
        if (category == Category.FoodAndAgriculture) return "Food & Agriculture";
        return "Other";
    }
    
    /**
     * @notice Helper function to convert Status enum to string
     */
    function getStatusString(Status status) public pure returns (string memory) {
        if (status == Status.Concept) return "Concept";
        if (status == Status.InDevelopment) return "In Development";
        if (status == Status.Completed) return "Completed";
        return "Archived";
    }
    
    // ============================================
    // INTERNAL FUNCTIONS
    // ============================================
    
    function _exists(uint256 tokenId) internal view returns (bool) {
        return _ownerOf(tokenId) != address(0);
    }
}
