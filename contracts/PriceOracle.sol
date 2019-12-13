pragma solidity ^0.5.8;

import "./Market.sol";

interface PriceOracle {
    /**
     * @notice Indicator that this is a PriceOracle contract (for inspection)
     */
    function isPriceOracle() external pure returns (bool);

    /**
      * @notice Get the underlying price of a market asset
      * @param market The market to get the underlying price of
      * @return The underlying asset price mantissa (scaled by 1e18).
      *  Zero means the price is unavailable.
      */
    function getUnderlyingPrice(Market market) external view returns (uint);
}
