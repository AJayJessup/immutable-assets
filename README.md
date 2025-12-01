**Immutable Assets V1.0.0 (Beta Template)**

**Public infrastructure for on-chain intellectual property ownership.**

**What Is This?**

**Immutable Assets** is an open-source smart contract template that allows anyone to mint timestamped proof of ownership for their ideas. Think of it as blockchain-verified "I thought of this first" with permanent attribution.

This is a **beta proof-of-concept** developed by [The Society](https://your-xtiles-link.com/) as part of the Immutable Assets protocol (ERC-7721 proposal). It's free to use, open source, and designed as public infrastructure.

**What This Template Does**

-   ✅ Mint ideas as NFTs with timestamped proof of creation
-   ✅ Store metadata (name, description, category, status, version, link)
-   ✅ Allow creators to update version numbers as ideas evolve
-   ✅ Establish permanent, on-chain attribution
-   ✅ No fees, no gatekeepers, no middlemen

**Want More?**

**The Society platform** (launching Q1 2026) extends this foundation with collaboration tools, revenue automation, and ecosystem features. This template is the core protocol---build on it however you want, or wait for the full platform experience. [Learn more at The Society Hub -  <https://xtiles.app/691edbc03ddc1246234f9740>]

**Why Does This Exist?**

**The Problem:** Creators lose ownership of their ideas to employers, platforms, or institutions. Proof of authorship is expensive ($150K+ for IP lawsuits) and inaccessible to most people.

**The Solution:** Blockchain enables anyone to establish timestamped, immutable proof of ownership---instantly and affordably.

**Our Mission:** Build public infrastructure that ensures ideas belong to those who think them. This template is the first step.

**Quick Start**

**For Non-Developers**

**1\. Deploy the Contract**

-   Go to [Remix IDE](https://remix.ethereum.org/)
-   Create a new file called ImmutableAssets.sol
-   Copy/paste the code from this repository
-   Compile (Solidity 0.8.19+)
-   Deploy to your chosen network (Polygon, Base, Zora, etc.)

**2\. Mint Your First Idea**

-   In Remix, find the mintIdea function
-   Fill in the required fields:

-   **name:** Title of your idea
-   **description:** What it's about
-   **category:** Number 0-13 (see Categories below)
-   **status:** Number 0-3 (see Statuses below)
-   **version:** e.g., "1.0.0"
-   **externalLink:** URL for more info (optional, can be empty)

-   Click "transact"
-   Your idea is now on the blockchain!

**3\. View Your Idea**

-   Check the transaction on a block explorer (Etherscan, Polygonscan, etc.)
-   Your idea NFT will appear in OpenSea (if on supported networks)
-   You now have permanent, timestamped proof of ownership

**For Developers**

**Installation:**

bash

*# Clone the repository*

git clone https://github.com/your-username/immutable-assets

cd immutable-assets

*# Install dependencies (if using Hardhat/Foundry)*

npm install

**Deployment:**

javascript

*// Example using ethers.js*

const ImmutableAssets = await ethers.getContractFactory("ImmutableAssets");

const contract = await ImmutableAssets.deploy();

await contract.deployed();

**Minting an Idea:**

javascript

const tx = await contract.mintIdea(

  "My Brilliant Idea",              *// name*

  "A solution to...",                *// description*

  0,                                  *// category (0 = Social Impact)*

  0,                                  *// status (0 = Concept)*

  "1.0.0",                           *// version*

  "https://example.com"              *// externalLink*

);

await tx.wait();

**Updating Version:**

javascript

*// Only the creator can update the version*

const tx = await contract.updateVersion(tokenId, "1.1.0");

await tx.wait();

**Reading Metadata:**

javascript

const metadata = await contract.getIdeaMetadata(tokenId);

console.log(metadata.name, metadata.creator, metadata.timestamp);

**Metadata Reference**

**Categories (0-13)**

-   0 - Social Impact
-   1 - Technology
-   2 - Art & Culture
-   3 - Community
-   4 - Research
-   5 - Business
-   6 - Education
-   7 - Health & Wellness
-   8 - Environment & Sustainability
-   9 - Finance & Economics
-   10 - Infrastructure
-   11 - Entertainment
-   12 - Food & Agriculture
-   13 - Other

**Statuses (0-3)**

-   0 - Concept
-   1 - In Development
-   2 - Completed
-   3 - Archived

**Use Cases**

**Individual Creators**

"I want to prove I came up with this design before pitching it to clients."

-   Mint your idea with timestamped proof
-   Show clients you own it
-   Update version as the idea evolves

**Research Labs**

"We need to document our experiments as they happen."

-   Deploy one contract for your lab
-   Researchers mint discoveries
-   Public record of your work

**Community Projects**

"We're building solutions together and want to credit everyone fairly."

-   Deploy for your community
-   Members mint ideas
-   Permanent attribution for all contributors

**Platform Builders**

"I want to build my own IP protection platform for my niche."

-   Fork this template as your foundation
-   Build custom frontend
-   Add your own features on top

**Integration Guide**

**Building on This Template**

If you're building a platform or application using Immutable Assets:

**1\. Deploy the Contract** Deploy this contract or use an existing deployment.

**2\. Build Your Frontend** Create a web interface that:

-   Connects to user wallets (MetaMask, Rainbow, etc.)
-   Calls mintIdea() with form inputs
-   Displays minted ideas from getIdeaMetadata()

**3\. Index the Data** Use tools like The Graph or your own indexer to:

-   Track all minted ideas
-   Filter by category, creator, status
-   Build search functionality

**4\. Extend Functionality** Add your own features:

-   Collaboration tools
-   Revenue sharing
-   Comments/feedback systems
-   Integration with other protocols

**The base contract handles ownership---you handle everything else.**

**Tracking & Ecosystem**

**The Society Tags**

Every idea minted with this template is automatically tagged with:

-   "platform": "The Society"
-   "standard": "Immutable Assets"
-   "contract_version": "1.0.0"
-   "template": true

This allows The Society to track adoption of the standard across the ecosystem. **Your ideas are NOT controlled by The Society**---these tags are just for ecosystem metrics.

**Privacy**

All metadata is stored on-chain and publicly visible. If you need privacy:

-   Use a burner wallet
-   Encrypt sensitive parts of your description
-   Store detailed info off-chain and link to it

**Roadmap**

**V1.0.0 (Current - Beta)**

✅ Basic minting with metadata\
✅ Version updates\
✅ No fees

**V2.0.0 (Q1 2026 - The Society Platform)**

🔜 Collaboration features\
🔜 Revenue distribution\
🔜 Token economy\
🔜 Team formation\
🔜 8% protocol fee on platform features

**Note:** Ideas minted with V1.0.0 will NOT be charged retroactive fees. This version is free forever.

**FAQ**

**Q: Is this free to use?**\
A: Yes. No fees. Public good. Open source.

**Q: Can I modify the code?**\
A: Yes, it's open source (MIT + Apache 2.0). However, if you modify it, your deployment won't be recognized as "official" by The Society platform.

**Q: Do I need to deploy my own contract?**\
A: Yes, unless you want to use someone else's deployment. Each deployment is independent.

**Q: Will my ideas show up on OpenSea?**\
A: Yes, if you deploy on a network OpenSea supports (Ethereum, Polygon, Arbitrum, etc.).

**Q: Can I sell my idea NFTs?**\
A: Yes, they're standard ERC-721 NFTs. Transfer/sell them however you want.

**Q: What's the difference between this and The Society platform?**\
A: This template = proof of ownership only. The Society platform = full collaboration ecosystem (coming Q1 2026).

**Q: Who owns the ideas I mint?**\
A: You do. The NFT represents ownership. It's yours forever (or until you transfer it).

**Q: Can I update my idea after minting?**\
A: You can only update the **version number**. Everything else is immutable to preserve the original timestamp and authenticity.

**License**

This project is dual-licensed under:

-   MIT License
-   Apache License 2.0

You may use this code under the terms of either license.

**Links**

-   **The Society Hub:** [ <https://xtiles.app/691edbc03ddc1246234f9740>]
-   **Full Documentation:** [https://docs.google.com/document/d/1ufKtwBlPTHE6iBiAurQxdRmvOE6pGz-GdhdwqZnzFlc/export?format=pdf]
-   **ERC-7721 Proposal:** [Coming Soon]
-   **Platform (V2.0):** [Coming Q1 2026]
-   **Support This Work:** [https://ko-fi.com/ajayjessup]

**Contributing**

This is a beta template. If you find bugs or have suggestions:

1.  Open an issue on GitHub
2.  Submit a pull request
3.  Join the discussion in [Discord/Community]

We're building public infrastructure. Your input matters.

**Contact**

**Founder:** Amber Jessup\
**Email:** [<amberrjessup@gmail.coml>]\
**Twitter/X:** [<https://x.com/Off_Kilterr>]\
**Discord:** [https://discord.gg/ZqRt4Tkj]

**Acknowledgments**

Built with:

-   OpenZeppelin contracts
-   Ethereum/EVM infrastructure
-   IPFS for decentralized storage
-   The belief that ideas should belong to those who think them

**"The old systems are crumbling. We're building what comes next."**

**\
**

