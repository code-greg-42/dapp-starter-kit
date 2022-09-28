// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

library BasicLibrary {
    function parseInt(string memory _string) internal pure returns (uint256) {
        bytes memory _bytes = bytes(_string);
        uint256 result = 0;
        for (uint8 i = 0; i < _bytes.length; i++) {
            result = result * 10 + (uint8(_bytes[i]) - 48);
        }
        return result;
    }

    function doubleHashVerification(
        bytes32 _hash,
        uint8 _v,
        bytes32 _r,
        bytes32 _s
    ) internal pure returns (address _signer) {
        bytes memory _prefix = "\x19Ethereum Signed Message:\n32";
        bytes32 _hashedEthMessage = keccak256(abi.encodePacked(_prefix, _hash));
        _signer = ecrecover(_hashedEthMessage, _v, _r, _s);
    }
}
