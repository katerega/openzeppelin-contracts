// SPDX-License-Identifier: GPL-3.0
pragma solidity = 0.7.6;// >=0.4.1 <0.9.0;
pragma abicoder v2;

//import '@uniswap/v3-periphery/contracts/libraries/TransferHelper.sol';
  // define a token's intrface
interface IERC20 {
 
    function balanceOf(address account) external view returns (uint256);
    function transfer(address to, uint256 amount) external returns (bool);
     function approve(address spender, uint256 amount) external returns (bool);
     function transferFrom(address from, address to, uint256 amount) external returns (bool);
}

import "https://github.com/Uniswap/v3-periphery/blob/main/contracts/interfaces/ISwapRouter.sol";
 //@uniswap/v3-periphery/contracts/interfaces/ISwapRouter.sol
contract FinalExecFL {


// list tokens binance smartchain
    address public constant WBNB = 0x6B175474E89094C44Da98b954EedeAC495271d0F;
    address public constant USDT = 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2;
    address public constant CAKE = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;
    address public constant BTCB = 0xA0b86991c6218b36c1d19D4a2e9Eb0cE3606eB48;

// define a token's router
address public constant routerAddress = 0xE592427A0AEce92De3Edee1F18E0157C05861564;
 ISwapRouter public immutable swapRouter= ISwapRouter(routerAddress);

// define token interface instance
  IERC20 public USDTtoken = IERC20(USDT);

 

// list exchanges binance smart chain
    address public constant pancakeswapRouteraddress = 0x10ED43C718714eb63d5aA57B78B54704E256024E;
    address public constant mdexRouterAddress = 0x7DAe51BD3E3376B8c7c4900E9107f12Be3AF1bA8;
     address public constant BiswapRouteraddress = 0x3a6d8cA21D1CF76F653A67577FA0D27453350dD8;


     // For this example, we will set the pool fee to 0.3%.
    uint24 public constant poolFee = 3000;

 // Constructor code is only run when the contract
    // is created
   constructor() {
        
    }


///pick order double e.g weth- usdc-matic
  

     
     function ExecuteDoubleOrders(address payable _to, string memory symbol1, string memory price1, string memory price2, string memory price3) public payable returns (string memory statusresult) {
      // swap in uniswap

      //send from uniswap to sushi swap

      //swap in sushi swap

      // send from sushi to fl contract in usdt
      // emit Transfer(msg.sender, pancakeswapaddress, 1);

        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
       // (bool sent, bytes memory data) = _to.call{value: msg.value}("1");
       // require(sent, "Failed to send Ether");
  
     

     }


       /// @return amountOut The amount of WETH9 received.
    function swapExactInputSingle(uint256 amountIn) external returns (uint256 amountOut) {
        // msg.sender must approve this contract

        // Transfer the specified amount of DAI to this contract.
        USDTtoken.transferFrom(msg.sender, address(this), amountIn);

        // Approve the router to spend DAI.
        USDTtoken.approve(address(swapRouter), amountIn);

        // Naively set amountOutMinimum to 0. In production, use an oracle or other data source to choose a safer value for amountOutMinimum.
        // We also set the sqrtPriceLimitx96 to be 0 to ensure we swap our exact input amount.
        ISwapRouter.ExactInputSingleParams memory params =
            ISwapRouter.ExactInputSingleParams({
                tokenIn: WBNB,
                tokenOut: CAKE,
                fee: poolFee,
                recipient: msg.sender,
                deadline: block.timestamp,
                amountIn: amountIn,
                amountOutMinimum: 0,
                sqrtPriceLimitX96: 0
            });

        // The call to `exactInputSingle` executes the swap.
        amountOut = swapRouter.exactInputSingle(params);
    }
     
  

///pick order double e.g usdc-weth-weth-usdc
  
     function ExecuteTripleOrders(address payable _to, string memory symbol1, string memory price1, string memory price2, string memory price3) public payable returns (string memory statusresult) {
      // swap in uniswap

      //send from uniswap to sushi swap

      //swap in sushi swap

      // send from sushi to fl contract in usdt
      // emit Transfer(msg.sender, pancakeswapaddress, 1);

        // Call returns a boolean value indicating success or failure.
        // This is the current recommended method to use.
        //(bool sent, bytes memory data) = _to.call{value: msg.value}("1");
       // require(sent, "Failed to send Ether");
  
     

     }

// check each tokenbalance then swap if its less to execute

//swap base token for network to token with token bal

// call arbitrage [swap, send]

//set max spend

//wallet bal > max spend

// triangular arbitrage

//grossprofit

//convert gprofit token to usd

//calcualte netprofit  ie  = slpagageex1 + sleapageex2 + crossexchangefees

// send profits to metamask every min $100 value hit



}
