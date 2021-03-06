pragma solidity ^0.5.16;

import '../IPOSDAORandom.sol';

contract RandomMock is IPOSDAORandom {
    uint256 private _collectRoundLength;

    constructor(uint256 _roundLength) public {
        _collectRoundLength = _roundLength;
    }

    function collectRoundLength() external view returns(uint256) {
        return _collectRoundLength;
    }

    function currentSeed() external view returns(uint256) {
        return uint256(keccak256(abi.encodePacked(block.timestamp)));
    }

    function isCommitPhase() external view returns(bool) {
        return (block.number % _collectRoundLength) < (_collectRoundLength / 2);
    }
}
