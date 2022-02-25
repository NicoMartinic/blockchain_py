// Test Coin's ICO

pragma solidity ^0.4.11;

contract TestCoin_ICO {

    // Maximum amount of TestCoin available for sale
    uint256 public max_TestCoin = 1000000;

    // USD to TestCoin conversion rate
    uint256 public usd_to_TestCoin = 1000;

    // Total amount bought by the investors
    uint256 public total_TestCoin_bought = 0;

    // Maping from investor address to its equity in TestCoun and USD
    mapping(address => uint256) equity_TestCoin;
    mapping(address => uint256) equity_usd;

    // Checking if an investor can buy TestCoin
    modifier can_buy_TestCoin(uint256 usd_invested) {
        require(usd_invested * usd_to_TestCoin + total_TestCoin_bought <= max_TestCoin);
        _;
    }

    // Getting the equity in TestCoin of an investor
    function equity_in_TestCoin(address investor) external constant returns (uint256) {
        return equity_TestCoin [investor];
    }

    // Getting equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint256) {
        return equity_usd [investor];
    }

    // Buying TestCoin
    function buy_TestCoin(address investor, uint256 usd_invested) external 
    can_buy_TestCoin(usd_invested) {
        uint256 TestCoin_bought = usd_invested * usd_to_TestCoin;
        equity_OtakuCoin[investor] += TestCoin_bought;
        equity_usd[investor] = equity_TestCoin[investor] / usd_to_TestCoin;
        total_TestCoin_bought += TestCoin_bought;
    }

    // Selling TestCoin
    function sell_TestCoin(address investor, uint256 TestCoin_to_sell) external {
        equity_TestCoin[investor] -= TestCoin_to_sell;
        equity_usd[investor] = equity_TestCoin[investor] / usd_to_TestCoin;
        total_TestCoin_bought -= TestCoin_to_sell;
    }

}
