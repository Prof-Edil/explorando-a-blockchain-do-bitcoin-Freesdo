#!/bin/bash

# Which public key signed input 0 in this tx:
#   `e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163`

txid="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"

tx=$(bitcoin-cli getrawtransaction $txid true)

publickeyencode=$(echo $tx | jq -r '.vin[0].txinwitness[2]')



pubkey1=$(echo "$publickeyencode" | grep -oP '2102\K[0-9a-fA-F]{66}' | sed 's/..$//' | head -n 1)
pubkey2=$(echo "$publickeyencode" | grep -oP '2102\K[0-9a-fA-F]{66}' | tail -n 1 | sed 's/..$//')


echo "02$pubkey1"

