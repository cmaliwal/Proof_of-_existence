pragma solidity ^0.4.19;

contract Proof {

    struct FileDetails {
        uint timestamp;
        string owner;
    }

    mapping (string  => FileDetails) files;

    event logFileAddedStatus(bool status, uint timestamp, string owner,string fileHash);

    function set(string owner, string fileHash) public {
        if (files[fileHash].timestamp == 0) {
            files[fileHash] = FileDetails(block.timestamp, owner);
            emit logFileAddedStatus(true, block.timestamp, owner, fileHash);
        } else {
            emit logFileAddedStatus(false, block.timestamp, owner, fileHash);
        }
    }

    function get(string fileHash) external view returns(uint, string) {
        return (files[fileHash].timestamp, files[fileHash].owner);
    }
}
