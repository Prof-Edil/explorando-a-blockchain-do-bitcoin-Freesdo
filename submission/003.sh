# How many new outputs were created by block 123,456?
blockTargetHash=$(bitcoin-cli getblockhash 123456)
vOutTx=$(bitcoin-cli getblock $blockTargetHash 2 | jq '[.tx[].vout | length] | add')
echo $vOutTx
