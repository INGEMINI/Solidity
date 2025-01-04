//SPDX-License-Identifier:MIT
//Software Package Data Exchange

pragma solidity ^0.8.26;
contract twitter{

uint16 constant mx_tweet_length=280;

 struct tweet{
    address author;
    string content;
    uint256 timestamp;
    uint256 likes;

 }
    mapping(address => tweet[])public tweets;


    function createtweet(string memory _tweet) public {
   
     require(bytes(_tweet).length<=mx_tweet_length,"tweet is too long ");
        tweet memory newtweet= tweet({

            author:msg.sender,
            content:_tweet,
            timestamp: block.timestamp,
            likes: 0
        });
        tweets[msg.sender].push(newtweet);
    }

    function gettweet(address _owner,uint _i) public view returns (tweet memory){
        return tweets[_owner][_i];
    }

function getalltweets( address _owner) public view returns (tweet[] memory){
    return tweets[_owner];
}

}
 