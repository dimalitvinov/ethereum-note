# Ethereum-note

## For development:

clone project
```shell
git clone https://github.com/dimalitvinov/ethereum-note.git .
```

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

## React-app
https://github.com/dimalitvinov/react-note or
```shell
git clone https://github.com/dimalitvinov/react-note.git .
```

in /react-note run
```shell
npm install
```

then, you need to know your smart-contract address and abi,
in /ethereum-note run

```shell
truffle console
> Notes.address
```
copy address and paste in "/react-note/src/config.js" like as "NotesContractAddress"

and
```shell
truffle console
> JSON.stringify(Notes.abi)
```
copy abi and paste in "/react-note/src/config.js" like as "NotesContractABI"

set in ETHEREUM_CLIENT line
HttpProvider to "http://localhost:8545"

now in /react-note run
```shell
npm start
```

then visit http://localhost:3000

## And GO!
