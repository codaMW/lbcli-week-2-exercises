#Create a raw transaction with an amount of 20,000,000 satoshis to this address: 2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP 
#Use the UTXOs from the transaction below
raw_tx="01000000000101c8b0928edebbec5e698d5f86d0474595d9f6a5b2e4e3772cd9d1005f23bdef772500000000ffffffff0276b4fa0000000000160014f848fe5267491a8a5d32423de4b0a24d1065c6030e9c6e000000000016001434d14a23d2ba08d3e3edee9172f0c97f046266fb0247304402205fee57960883f6d69acf283192785f1147a3e11b97cf01a210cf7e9916500c040220483de1c51af5027440565caead6c1064bac92cb477b536e060f004c733c45128012102d12b6b907c5a1ef025d0924a29e354f6d7b1b11b5a7ddff94710d6f0042f3da800000000"

# Decode UTXO details
#txID=$(bitcoin-cli -regtest decoderawtransaction ${raw_tx} | jq -r '.vin[0].txid')
#vout=$(bitcoin-cli -regtest decoderawtransaction ${raw_tx} | jq -r '.vin[0].vout')

# Transaction details
#amount=0.2  # 20,000,000 satoshis in BTC
#addr="2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP"

# Create raw transaction
#raw_new_tx=$(bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$txID\",\"vout\":$vout}]" "{\"$addr\":$amount}")

# Output the new raw transaction
#echo "$raw_new_tx"



# Decode transaction details
txID=$(bitcoin-cli -regtest decoderawtransaction "$raw_tx" | jq -r '.vin[0].txid')
vout=$(bitcoin-cli -regtest decoderawtransaction "$raw_tx" | jq -r '.vin[0].vout')

# Debug: Check extracted values
echo "txID: $txID, vout: $vout"

# Exit if txID or vout are invalid
if [[ -z "$txID" || -z "$vout" ]]; then
  echo "Error: Could not extract txID or vout from raw transaction!"
  exit 1
fi

# Transaction details
amount=$(bc <<< "scale=8; 20000000/100000000")  # Ensures correct BTC format
addr="2MvLcssW49n9atmksjwg2ZCMsEMsoj3pzUP"

# Create raw transaction
json_out=$(printf '{"%s": %.8f}' "$addr" "$amount")
raw_new_tx=$(bitcoin-cli -regtest createrawtransaction "[{\"txid\":\"$txID\",\"vout\":$vout}]" "$json_out")

# Output the new raw transaction
echo "Raw Transaction: $raw_new_tx"


