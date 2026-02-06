# Decentralized IDO Launchpad

This repository provides a scalable framework for launching crypto projects. It features a **Factory Pattern**, allowing a main contract to deploy individual "Sale Pools" for different projects.

## Features
* **Factory Architecture:** Deploy new sale contracts with a single transaction.
* **Flexible Sale Types:** Supports fixed-price swaps and tiered access.
* **Contribution Management:** Handles whitelisting, hard caps, and individual maximums.
* **Automatic Distribution:** Users can claim their tokens once the sale concludes successfully.



## Operational Flow
1. **Deployment:** Factory contract is deployed.
2. **Creation:** A project owner calls `createPool` via the factory.
3. **Sale Phase:** Investors contribute ETH/USDC to the pool.
4. **Finalization:** If the hard cap is met, tokens are distributed; if not, users are refunded.
