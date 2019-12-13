pragma solidity ^0.5.8;

import "./Market.sol";
import "./PriceOracle.sol";

contract RiskCenterAdminStorage {
    /**
    * @notice Administrator for this contract
    */
    address public admin;

    /**
    * @notice Pending administrator for this contract
    */
    address public pendingAdmin;

    /**
    * @notice Active brains of RiskCenter
    */
    address public riskManagerImplementation;

    /**
    * @notice Pending brains of RiskCenter
    */
    address public pendingRiskManagerImplementation;
}

contract RiskManagerV1Storage is RiskCenterAdminStorage {

    /**
     * @notice Oracle which gives the price of any given asset
     */
    PriceOracle public oracle;

    /**
     * @notice Multiplier used to calculate the maximum repayAmount when liquidating a borrow
     */
    uint public closeFactorMantissa;

    /**
     * @notice Multiplier representing the discount on collateral that a liquidator receives
     */
    uint public liquidationIncentiveMantissa;

    /**
     * @notice Max number of assets a single account can participate in (borrow or use as collateral)
     */
    uint public maxAssets;

    /**
     * @notice Per-account mapping of "assets you are in", capped by maxAssets
     */
    mapping(address => Market[]) public accountAssets;

}

contract RiskManagerV2Storage is RiskManagerV1Storage {
    struct MarketInfo {
        /**
         * @notice Whether or not this market is listed
         */
        bool isListed;

        /**
         * @notice Multiplier representing the most one can borrow against their collateral in this market.
         *  For instance, 0.9 to allow borrowing 90% of collateral value.
         *  Must be between 0 and 1, and stored as a mantissa.
         */
        uint collateralFactorMantissa;

        /**
         * @notice Per-market mapping of "accounts in this asset"
         */
        mapping(address => bool) accountMembership;
    }

    /**
     * @notice Official mapping of markets -> Market metadata
     * @dev Used e.g. to determine if a market is supported
     */
    mapping(address => MarketInfo) public markets;


    /**
     * @notice The Pause Guardian can pause certain actions as a safety mechanism. Actions which allow users to remove their own assets cannot be paused.
     */
    address public pauseGuardian;
    bool public mintGuardianPaused;
    bool public borrowGuardianPaused;
    bool public transferGuardianPaused;
    bool public seizeGuardianPaused;
}
