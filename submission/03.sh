# Created a SegWit address.
# Add funds to the address.
# Return only the Address


SEGWIT=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getnewaddress "" "bech32")

bitcoin-cli -regtest -rpcwallet=btrustwallet generatetoaddress 101 "$SEGWIT"

echo "$SEGWIT"

