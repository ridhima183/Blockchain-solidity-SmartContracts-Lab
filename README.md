# 🔗 Solidity Lab Codes

A collection of beginner-to-intermediate **Solidity smart contracts** written and tested as part of blockchain lab coursework. Each contract demonstrates a core Web3 concept — tokens, NFTs, voting, escrow, DAOs, multisig wallets, and more — in a single, self-contained file.

![Solidity](https://img.shields.io/badge/Solidity-%5E0.8.0-363636?logo=solidity)
![License](https://img.shields.io/badge/License-MIT-green)
![Status](https://img.shields.io/badge/Status-Educational-blue)

---

## 📚 What is Blockchain?

A **blockchain** is a distributed, tamper-resistant digital ledger. Instead of one central authority (like a bank or server) keeping records, copies of the ledger are maintained across a network of computers ("nodes"). New entries are grouped into **blocks**, cryptographically linked to the previous block (forming a "chain"), and agreed upon by the network using a **consensus mechanism** (e.g., Proof of Work, Proof of Stake).

**Why it matters:**
- **Decentralization** – no single point of control or failure
- **Immutability** – once recorded, data is extremely difficult to alter
- **Transparency** – transactions are publicly verifiable
- **Trustless execution** – parties can transact without needing to trust each other, only the protocol

## 📈 Why Blockchain Is Trending

Blockchain has moved well beyond cryptocurrency speculation into practical infrastructure:

| Trend | Description |
|---|---|
| **DeFi (Decentralized Finance)** | Lending, borrowing, and trading without banks — e.g., token banks, liquidity pools |
| **NFTs & Digital Ownership** | Verifiable ownership of digital art, gaming assets, tickets, and identity via ERC-721/ERC-1155 |
| **DAOs** | Organizations governed by code and token-holder votes instead of a central management team |
| **Tokenization of Real-World Assets** | Real estate, supply chains, and insurance being represented and tracked on-chain |
| **Layer 2 & Scalability** | Rollups and sidechains making Ethereum-based apps cheaper and faster |
| **Enterprise Adoption** | Supply chain traceability, cross-border payments, and audit trails using permissioned/public ledgers |

## 📜 What is a Smart Contract?

A **smart contract** is self-executing code deployed on a blockchain. It automatically enforces the rules written into it — no intermediary required.

- Written in languages like **Solidity** (this repo), Vyper, or Rust
- Deployed once, then lives permanently at a fixed **address** on the blockchain
- Executes deterministically: given the same inputs, it always produces the same outputs
- Triggered by **transactions** sent from external accounts or other contracts
- State changes cost **gas** (a fee paid to the network for computation)

**Real-world analogy:** Think of a vending machine. You insert the correct payment, select an item, and the machine *automatically* dispenses it — no cashier, no negotiation, no trust required beyond the machine's logic. A smart contract works the same way, just for digital assets and agreements.

---

## 🧩 Contracts in This Repository

| # | Contract | Concept Demonstrated |
|---|----------|----------------------|
| 1 | `MyToken.sol` | Basic **ERC-20-style fungible token** — balances, `transfer`, `approve`/`allowance` |
| 2 | `MyERC721.sol` | Minimal **ERC-721 NFT** — unique token IDs, ownership mapping, minting |
| 3 | `MyERC1155.sol` | **ERC-1155 multi-token** standard — fungible + non-fungible IDs in one contract |
| 4 | `Voting.sol` | On-chain **election system** — candidates, one-vote-per-address, admin setup |
| 5 | `Multisig.sol` | **Multi-signature wallet** — transactions require approval from multiple owners |
| 6 | `Timelock.sol` | **Time-locked vault** — funds can only be withdrawn after a set unlock time |
| 7 | `escrow.sol` | **Escrow agreement** — buyer deposits funds, released to seller on delivery confirmation |
| 8 | `Insurance.sol` | Simplified **insurance policy** — premium payment, policy activation, claims |
| 9 | `SupplyChain.sol` | **Supply chain tracking** — role-based product handoff between supplier → distributor → retailer |
| 10 | `TokenBank.sol` | **Deposit/withdraw bank** built on top of an external ERC-20 token via interface |
| 11 | `DAOpool.sol` | Minimal **DAO with liquidity pool** — deposits, proposals, and voting |

Each file is self-contained and can be compiled/deployed independently.

---

## 🛠️ Tech Stack

- **Language:** Solidity `^0.8.0`
- **License:** MIT (SPDX identifier in every file)
- **Recommended tools:**
  - [Remix IDE](https://remix.ethereum.org/) — fastest way to compile, deploy, and test individual contracts in-browser
  - [Hardhat](https://hardhat.org/) or [Foundry](https://book.getfoundry.sh/) — for local development, scripting, and automated tests
  - [MetaMask](https://metamask.io/) — wallet for interacting with deployed contracts on testnets

---

## 🚀 Getting Started

### Option 1: Remix IDE (quickest, no setup)
1. Go to [remix.ethereum.org](https://remix.ethereum.org/)
2. Create a new file and paste the contract code (or drag-and-drop the `.sol` file)
3. Compile using the Solidity compiler tab (select version `0.8.x`)
4. Deploy using the "Deploy & Run Transactions" tab — choose **Remix VM** for a local sandbox, or **Injected Provider (MetaMask)** for a real testnet

### Option 2: Hardhat (local project setup)
```bash
# 1. Clone this repo
git clone <your-repo-url>
cd solidity-lab-codes

# 2. Initialize a Hardhat project
npm init -y
npm install --save-dev hardhat
npx hardhat init

# 3. Copy contracts into the contracts/ folder, then compile
npx hardhat compile

# 4. Run a local node and deploy
npx hardhat node
npx hardhat run scripts/deploy.js --network localhost
```

---

## ⚠️ Disclaimer

These contracts are written for **educational purposes** as part of lab coursework. They demonstrate core concepts but are **not audited** and should **not** be used in production or with real funds without a thorough security review (reentrancy checks, access control hardening, integer edge cases, gas optimization, etc.).

---

## 📄 License

Each contract is released under the **MIT License**, as declared in its SPDX header.
