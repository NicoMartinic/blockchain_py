// Otaku Coin's ICO

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

    // Getting the equity in OtakuCoin of an investor
    function equity_in_OtakuCoin(address investor) external constant returns (uint256) {
        return equity_OtakuCoin [investor];
    }

    // Getting equity in USD of an investor
    function equity_in_usd(address investor) external constant returns (uint256) {
        return equity_usd [investor];
    }

    // Buying OtakuCoin
    function buy_OtakuCoin(address investor, uint256 usd_invested) external 
    can_buy_OtakuCoin(usd_invested) {
        uint256 OtakuCoin_bought = usd_invested * usd_to_OtakuCoin;
        equity_OtakuCoin[investor] += OtakuCoin_bought;
        equity_usd[investor] = equity_OtakuCoin[investor] / usd_to_OtakuCoin;
        total_OtakuCoin_bought += OtakuCoin_bought;
    }

    // Selling OtakuCoin
    function sell_OtakuCoin(address investor, uint256 OtakuCoin_to_sell) external {
        equity_OtakuCoin[investor] -= OtakuCoin_to_sell;
        equity_usd[investor] = equity_OtakuCoin[investor] / usd_to_OtakuCoin;
        total_OtakuCoin_bought -= OtakuCoin_to_sell;
    }

}
