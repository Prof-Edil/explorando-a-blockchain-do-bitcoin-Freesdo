#!/bin/bash

txid="e5969add849689854ac7f28e45628b89f7454b83e9699e551ce14b6f90c86163"

tx=$(./bitcoin-cli getrawtransaction $txid true)

publickey=$(echo $tx | jq -r '.vin[0].txinwitness[2]')

pubkey=$(echo $publickey | grep -oP '2102\K[0-9a-fA-F]{66}')

echo "$pubkey"
