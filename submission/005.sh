# Create a 1-of-4 P2SH multisig address from the public keys in the four inputs of this tx:
#   `37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517`

key0=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 true | jq -r '.vin[0].txinwitness[1]')
key1=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 true | jq -r '.vin[1].txinwitness[1]')
key2=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 true | jq -r '.vin[2].txinwitness[1]')
key3=$(bitcoin-cli getrawtransaction 37d966a263350fe747f1c606b159987545844a493dd38d84b070027a895c4517 true | jq -r '.vin[3].txinwitness[1]')

parser="[\"$key0\", \"$key1\", \"$key2\", \"$key3\"]"

bitcoin-cli createmultisig 1 "$parser"
