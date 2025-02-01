#!/bin/bash

blockHash=$(bitcoin-cli getblockhash 123321)
infoBlock=$(bitcoin-cli getblock $blockHash | jq -r '.tx[]')
addr=""

for txid in $infoBlock; do
  
  tx=$(bitcoin-cli getrawtransaction $txid true)
  vout_count=$(echo "$tx" | jq '.vout | length')
  for (( i=0; i<$vout_count; i++ )); do
    address=$(bitcoin-cli gettxout $txid $i)
    if [[ -z "$address" ]]; then
      :
    else
      echo $address | jq -r '.scriptPubKey.address'
      exit 0
    fi

  done
done
