# CharleneCoin Solidity Project

## Overview
This project involves the creation and deployment of a smart contract called **CharleneCoin** using Solidity. The smart contract is designed to manage transactions, log flagged transactions, and enforce constraints such as flagged addresses and transaction limits.

## Features
- **Transaction Logging**: Captures and records flagged transactions based on defined conditions.
- **Address Constraints**: Maintains a blacklist of flagged addresses to prevent fraudulent transactions.
- **Transaction Limits**: Identifies transactions exceeding a specific threshold for further review.
- **Testing and Deployment**: Includes rigorous testing and successful deployment on the Ethereum blockchain.


## Installation

### Prerequisites
- **Node.js**: Install [Node.js](https://nodejs.org/) to use npm.
- **Remix IDE**: Use [Remix IDE](https://remix.ethereum.org/) for compiling and deploying the contract.
- **Ethereum Wallet**: Set up a wallet like MetaMask for deployment.

### Steps
1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/CharleneCoin.git
   cd CharleneCoin
   ```
2. Install dependencies (if applicable):
   ```bash
   npm install
   ```
3. Open `CharleneCoin.sol` in Remix IDE.
4. Compile and deploy the contract using Remix or a suitable Ethereum development environment.

## Usage

### Deploying the Contract
1. Open Remix IDE and upload the `CharleneCoin.sol` file.
2. Compile the contract using the **Solidity Compiler**.
3. Deploy the contract using the **Deploy & Run Transactions** tab.

### Interacting with the Contract
- **Blacklist an Address**:
  Use the `addToBlacklist(address)` function to add an address to the blacklist.
- **Send Transactions**:
  Use the `transfer(address recipient, uint256 amount)` function to send transactions and test for flagged cases.
- **View Flagged Transactions**:
  Use the `getFlaggedTransactions()` function to retrieve logged flagged transactions.

## Testing

### Conditions Tested
- Transactions to blacklisted addresses.
- Transactions exceeding the defined amount threshold.

### Tools Used
- Remix IDE console.
- Ganache for local blockchain simulation.

### Results
All flagged transactions were successfully logged, and constraints were enforced without issues.

## License
This project is licensed under the [MIT License](LICENSE).

## Contact
If you have any questions or need further assistance, feel free to contact me:
- Email: [noyecharlene@gmail.com](mailto:noyecharlene@gmail.com)
- GitHub: [https://github.com/yourusername](https://github.com/yourusername)

---

### Acknowledgments
Thanks to the Remix IDE team and Solidity documentation for providing essential tools and guides.
