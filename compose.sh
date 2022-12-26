#!/bin/bash
echo "LIMIT ORDER *7"
for((i=0;i<7;i++))
   do
ACC=$(seid q account $ADDRESS -o json | jq -r .account_number)
seq=$(seid q account $ADDRESS -o json | jq -r .sequence)
seid tx sign $HOME/call1limit_tx.json -s $seq -a $ACC --offline \
--from test --chain-id atlantic-1 \
--output-document $HOME/txs.json
seid tx broadcast $HOME/txs.json
   done


echo "MARKET ORDER *7"
for ((i=0 ; i<7 ; i++))
    do
ACC=$(seid q account $ADDRESS -o json | jq -r .account_number)
seq=$(seid q account $ADDRESS -o json | jq -r .sequence)
seid tx sign $HOME/call1Market_tx.json -s $seq -a $ACC --offline \
--from test --chain-id atlantic-1 \
--output-document $HOME/txs.json
seid tx broadcast $HOME/txs.json
done

echo "MULTI ORDER"
ACC=$(seid q account $ADDRESS -o json | jq -r .account_number)
seq=$(seid q account $ADDRESS -o json | jq -r .sequence)
seid tx sign $HOME/gen_tx.json -s $seq -a $ACC --offline \
--from test --chain-id atlantic-1 \
--output-document $HOME/txs.json
seid tx broadcast $HOME/txs.json