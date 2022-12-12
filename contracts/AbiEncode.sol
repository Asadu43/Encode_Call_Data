pragma solidity ^0.8.0;

interface IERC20 {
  function transfer(address, uint256) external;
}

contract Token {
  function transfer(address, uint256) external {}
}

contract AbiEncode {
  function test(address _contract, bytes calldata data) external {
    (bool oK, ) = _contract.call(data);
    require(oK, "Call Failed");
  }

  function encodeWithSignature(address to, uint256 amount) external pure returns (bytes memory) {
    return abi.encodeWithSignature("transfer(address,uint256)", to, amount);
  }

  function encodewithSelector(address to, uint256 amount) external pure returns (bytes memory) {
    return abi.encodeWithSelector(IERC20.transfer.selector, to, amount);
  }

  //   function encodeCall(address to, uint256 amount) external pure returns (bytes memory) {
  //     return abi.encodeCall(IERC20.transfer, (to, amount));
  //   }
}
