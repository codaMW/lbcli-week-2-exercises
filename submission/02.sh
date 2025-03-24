# Create a new Bitcoin address, for receiving change.

changeaddress=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getrawchangeaddress)

echo "$changeaddress"
