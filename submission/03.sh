# Created a SegWit address.
# Add funds to the address.
# Return only the Address



# Generate a new SegWit address
SEGWIT=$(bitcoin-cli -regtest getnewaddress "bech32")

# Mine 101 blocks to the address
bitcoin-cli -regtest generatetoaddress 101 "${SEGWIT}"

# Print only the SegWit address
echo "$SEGWIT"

