// SPDX-License-Identifier: MIT
pragma solidity ^0.7.6;

pragma experimental ABIEncoderV2;

import "./RewardTokensV1.sol";

contract RewardTokensFactoryV1 {
    address[] public tokens;

    event CreateRewardToken(address indexed token);

    constructor() {}

    function createRewardToken(
        string memory name,
        string memory symbol,
        uint8 decimals,
        uint256 supply,
        address dev_wallet,
        RewardTokensV1.Fees memory fees,
        address reward_token
    ) public {
        RewardTokensV1 token = new RewardTokensV1(
            name,
            symbol,
            decimals,
            supply,
            dev_wallet,
            fees,
            reward_token
        );

        tokens.push(address(token));

        emit CreateRewardToken(address(token));
    }
}