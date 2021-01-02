// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";


contract MockERC20 is ERC20 {
  constructor(string memory name, string memory symbol) public ERC20(name, symbol) {}

  // Mocks WETH deposit fn
  function deposit() external payable {
    _mint(msg.sender, msg.value);
  }

  function withdraw(uint256 amount) external {
    if (address(this).balance >= amount) {
      msg.sender.transfer(amount);
    }
    _burn(msg.sender, amount);
  }

  function getFreeTokens(address to, uint256 amount) public {
    _mint(to, amount);
  }
}