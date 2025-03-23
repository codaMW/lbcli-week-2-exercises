# Created a SegWit address.
# Add funds to the address.
# Return only the Address



# Ensure Bitcoin Core is running in regtest mode
if ! bitcoin-cli -regtest getblockchaininfo &>/dev/null; then
  echo "Error: Bitcoin Core is not running in regtest mode!"
  exit 1
fi

# Ensure the wallet exists
if ! bitcoin-cli -regtest -rpcwallet=btrustwallet getwalletinfo &>/dev/null; then
  echo "Creating wallet..."
  bitcoin-cli -regtest createwallet btrustwallet
fi

# Generate a new SegWit address
SEGWIT=$(bitcoin-cli -regtest -rpcwallet=btrustwallet getnewaddress "" "bech32")

# Validate the address
if ! bitcoin-cli -regtest validateaddress "$SEGWIT" | grep -q '"isvalid": true'; then
  echo "Error: Invalid SegWit address!"
  exit 1
fi

# Mine 101 blocks to the address
bitcoin-cli -regtest -rpcwallet=btrustwallet generatetoaddress 101 "$SEGWIT"

# Print only the SegWit address
echo "$SEGWIT"

