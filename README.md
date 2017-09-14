# Ethereum-note

## For development:


in /ethereum-note run
```shell
npm install ethereumjs-testrpc web3 solc
npm install -g truffle
testrpc
```

and run
```shell
truffle compile
truffle migrate
```
then, you need to know your smart-contract address and abi
```shell
truffle console
> Notes.address
```
copy address and paste in "config.js" like as "NotesContractAddress"

and
```shell
truffle console
> JSON.stringify(Notes.abi)
```
copy abi and paste in "config.js" like as "NotesContractABI"

## React-app
https://github.com/dimalitvinov/react-note

in /react-note run
```shell
npm install
npm start
```

then visit http://localhost:3000

## And GO!
