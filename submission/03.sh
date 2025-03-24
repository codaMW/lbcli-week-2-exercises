# Created a SegWit address.
# Add funds to the address.
# Return only the Address


# Generate a new SegWit address (Bech32 format)
SEGWIT=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getnewaddress "" bech32)

# Mine 101 blocks to the generated address
bitcoin-cli -regtest generatetoaddress 101 "$SEGWIT"

# Fetch and return only the address from the UTXO set
Returned_addr=$(bitcoin-cli -regtest -rpcwallet=btrustwallet listunspent | jq -r '.[0].address')

# Print the returned address
echo "$Returned_addr"

