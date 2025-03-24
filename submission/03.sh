# Created a SegWit address.
# Add funds to the address.
# Return only the Address


SEGWIT=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getnewaddress "" bech32)

mining=$(bitcoin-cli -regtest generatetoaddress 101 "$SEGWIT")

#Returned_addr=$(bitcoin-cli -regtest -rpcwallet=btrustwallet listunspent | jq -r '.[0].address')

#echo "$Returned_addr"

echo "$SEGWIT"

