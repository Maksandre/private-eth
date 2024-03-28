geth --datadir node2 \
  --port 30307 \
  --bootnodes enode://782dcfc0259614ba355049a3726877f411093ee9786b8dce64d5383585e6a053f55eb751290154824493a4ec6a56fae377da2c75832cd28bb42acbb80d507ddb@127.0.0.1:0?discport=30305 \
  --networkid 123454321 \
  --unlock 0xeda96c4284D3Ab9DF63B2e6b76408e60B224AED2 \
  --password node2/password.txt \
  --authrpc.port 8552 \
  --mine \
  --miner.etherbase 0xeda96c4284D3Ab9DF63B2e6b76408e60B224AED2
