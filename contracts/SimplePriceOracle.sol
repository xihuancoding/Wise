pragma solidity ^0.5.8;

import "./PriceOracle.sol";
import "./MarketErc20.sol";

contract SimplePriceOracle is PriceOracle {
    mapping(address => uint) prices;
    bool public constant isPriceOracle = true;
    event PricePosted(address asset, uint previousPriceMantissa, uint requestedPriceMantissa, uint newPriceMantissa);


    function getUnderlyingPrice(Market market) public view returns (uint) {
        return prices[address(MarketErc20(address(market)).underlying())];
    }

    function setUnderlyingPrice(Market market, uint underlyingPriceMantissa) public {
        address asset = address(MarketErc20(address(market)).underlying());
        emit PricePosted(asset, prices[asset], underlyingPriceMantissa, underlyingPriceMantissa);
        prices[asset] = underlyingPriceMantissa;
    }

    function setDirectPrice(address asset, uint price) public {
        emit PricePosted(asset, prices[asset], price, price);
        prices[asset] = price;
    }

    // v1 price oracle interface for use as backing of proxy
    function assetPrices(address asset) external view returns (uint) {
        return prices[asset];
    }
}
