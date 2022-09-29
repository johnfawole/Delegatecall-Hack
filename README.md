# Delegatecall-Hack
In this repo, I gave an instance of how a contract can make a vulnerable delegatecall.

 ## Motivation
 
 Delegatecall is one of the low-level methods that contracts use to interact. However, it can open the door for an attacker.
 I delved into this project to stregthen my knowledge of smart contract security.
 
 Although I had known how to make innocent delegatecalls, this project gave me an opportunity to know how to hijack it.
 
 ## What happened in this contract?
 
 The vulnerable contract has a fallback function that triggered a delegatecall to the V2 contract. For those who do not know, the fallback function is fired once 
 someone calls a function that is not included in a contract or does not have a data.
 
 The V2 contract is the contract that the delegation was made to. It assigned to owner to be the msg.sender.
 
 The Sniper contract is an attacker contract. Notice that I passed the address of the vulnerable contract into its parameter. When we have deployed, this would be the 
 space where we would paste the contract address of the vulnerable contract.
 
 I included one function to hijack the ownership.
 
 ## Learnings
 
 In summary, these were the things I learned:
 - how a contract can delegatecall
 - how an attacking contract can hack the delegated contract and eventually exploit the main contract
 - stregthened my knowledge of how to use abi.encodewithSignature in real-time
