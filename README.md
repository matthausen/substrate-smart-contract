## Substrate Smart Contract
This is a basic example of a substrate smart contract built with the !ink framework and Rust.

It allows to flip a bool value and retrieve it.


### How to run
After building the project, you can upload the contract flipper.contract on your local running substrate node, here:

https://paritytech.github.io/canvas-ui/#/instantiate

You can: 

1) send as a transaction flip() to change the bool value
2) send as RPC call get() to retrieve its value