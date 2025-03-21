# Created a SegWit address.
# Add funds to the address.
# Return only the Address

SEGWIT=$(bitcoin-cli -regtest getnewaddress "" bech32)

bitcoin-cli -regtest generatetoaddress 101 $SEGWIT

echo $SEGWIT

