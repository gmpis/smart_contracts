pragma solidity ^0.5.1;


contract Timelock {

	address payable public beneficiary;
	uint256 public releaseTimestamp;

	constructor(address payable _beneficiary, uint256 _releaseTimestamp) public payable {
		require(_releaseTimestamp > block.timestamp);
		beneficiary = _beneficiary;
		releaseTimestamp = _releaseTimestamp;
	}


	function release() public {
		require(block.timestamp >= releaseTimestamp);
		address(beneficiary).transfer(address(this).balance);
	}


}
