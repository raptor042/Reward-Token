// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

import "./RewardTokenV1.sol";

contract RewardTokenFactoryV1 {
    address[] public tokens;

    event CreateRewardToken(address indexed token);

    constructor() {}

    function createRewardToken(
        string memory _name,
        string memory _symbol,
        uint256 _supply,
        address marketing_wallet,
        address dev_wallet,
        RewardTokenV1.Fees memory fees,
        address _token
    ) public {
        RewardTokenV1 token = new RewardTokenV1(
            _name,
            _symbol,
            _supply,
            marketing_wallet,
            dev_wallet,
            fees,
            _token
        );

        tokens.push(address(token));

        emit CreateRewardToken(address(token));
    }
}