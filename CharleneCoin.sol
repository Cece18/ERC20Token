// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CharleneCoin is ERC20, Ownable {
    // Mapping for whitelisted addresses
    mapping(address => bool) private whitelistedAddresses;

    // Struct to store abnormal transactions
    struct AbnormalTransaction {
        address sender;
        address receiver;
        uint256 amount;
        uint256 timestamp;
    }

    // Array to store abnormal transactions
    AbnormalTransaction[] public abnormalTransactions;

    // Fixed flagged address
    address constant flaggedAddress = 0x4B20993Bc481177ec7E8f571ceCaE8A9e22C02db;

    // Constructor to initialize token details and ownership
    constructor() ERC20("CharleneCoin", "CHN") Ownable(msg.sender) {}

    // Custom mint method restricted to the owner
    function mint(address to, uint256 amount) external onlyOwner {
        _mint(to, amount);
    }

    // Add an address to the whitelist
    function addWhitelist(address account) external onlyOwner {
        whitelistedAddresses[account] = true;
    }

    // Remove an address from the whitelist
    function removeWhitelist(address account) external onlyOwner {
        whitelistedAddresses[account] = false;
    }

    // Get the whitelist status of an address
    function getWhitelistStatus(address account) external view returns (bool) {
        return whitelistedAddresses[account];
    }

    // Custom logic to handle abnormal transactions
    function recordAbnormalTransaction(address from, address to, uint256 amount) private {

        require(
            whitelistedAddresses[from] && whitelistedAddresses[to],
            "Both sender and receiver must be whitelisted"
        );

        // Check if transaction is abnormal
        if (
            amount > 15 || // Transaction amount > 15 tokens
            (block.timestamp % 86400 >= 3600 && block.timestamp % 86400 < 10800) || // Between 1AM to 3AM
            (to == flaggedAddress) // Specific flagged address
        ) {
            // Store abnormal transaction
            abnormalTransactions.push(
                AbnormalTransaction({
                    sender: from,
                    receiver: to,
                    amount: amount,
                    timestamp: block.timestamp
                })
            );
        }
    }

    // Override transfer to include AML logic
    function transfer(address to, uint256 amount) public override returns (bool) {
        address sender = _msgSender();
        recordAbnormalTransaction(sender, to, amount);
        return super.transfer(to, amount);
    }

    // Override transferFrom to include AML logic
    function transferFrom(
        address from,
        address to,
        uint256 amount
    ) public override returns (bool) {
        require(
            allowance(from, _msgSender()) >= amount,
            "ERC20: transfer amount exceeds allowance"
        );

        require(
            whitelistedAddresses[from] && whitelistedAddresses[to],
            "Both sender and receiver must be whitelisted"
        );
        recordAbnormalTransaction(from, to, amount);
        return super.transferFrom(from, to, amount);
    }

    // Get all abnormal transactions
    function getAbnormalTransactions() external view returns (AbnormalTransaction[] memory) {
        return abnormalTransactions;
    }
}
