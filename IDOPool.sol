// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract IDOPool is Ownable {
    IERC20 public token;
    uint256 public rate; // Tokens per Wei
    uint256 public hardCap;
    uint256 public raised;
    bool public finalized;

    mapping(address => uint256) public contributions;

    constructor(address _token, uint256 _rate, uint256 _cap, address _owner) Ownable(_owner) {
        token = IERC20(_token);
        rate = _rate;
        hardCap = _cap;
    }

    function buyTokens() external payable {
        require(!finalized, "Sale finalized");
        require(raised + msg.value <= hardCap, "Hard cap reached");

        contributions[msg.sender] += msg.value;
        raised += msg.value;
    }

    function finalize() external onlyOwner {
        finalized = true;
        uint256 balance = token.balanceOf(address(this));
        require(balance > 0, "No tokens in pool");
        // Logic to transfer raised funds to project owner
        payable(owner()).transfer(address(this).balance);
    }

    function claimTokens() external {
        require(finalized, "Not finalized");
        uint256 amount = contributions[msg.sender] * rate;
        require(amount > 0, "No tokens to claim");
        
        contributions[msg.sender] = 0;
        token.transfer(msg.sender, amount);
    }
}
