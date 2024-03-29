## TL;DR

1. **Install Geth**: Download and install Geth: https://geth.ethereum.org/docs/getting-started/installing-geth

2. **Init node 1:**

```sh
geth --datadir node1 init genesis.json
```

3. **Run bootnode:**

```sh
bootnode -nodekey boot.key -addr :30305
```

4. **Run node**
```sh
./node1.sh
```

5. **Connect to node**: http://127.0.0.1:8555


### Step-1: Create Accounts for Each Node

You'll need separate folders for each node in your network to keep their data isolated.

```sh
mkdir node1 node2
```

Each node needs an account to participate in the network. Here's how to create one for Node 1. Repeat for Node 2 using its folder.


```sh
geth --datadir node1 account new
geth --datadir node2 account new
```

You'll be prompted to create a password. Save them to the `password.txt` file for each node.

### Step-2: Prepare the Genesis File

The genesis file is like the first page of your private blockchain.

Here's a simplified `genesis.json` you can use:

```json
{
  "config": {
    "chainId": 123454321,
    "homesteadBlock": 0,
    "eip150Block": 0,
    "eip155Block": 0,
    "eip158Block": 0,
    "byzantiumBlock": 0,
    "constantinopleBlock": 0,
    "petersburgBlock": 0,
    "istanbulBlock": 0,
    "clique": {
      "period": 15,
      "epoch": 30000
    }
  },
  "difficulty": "1",
  "gasLimit": "8000000",
  "extradata": "0x0000000000000000000000000000000000000000000000000000000000000000<PUBLIC-KEY-HERE>0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000",
  "alloc": {
    "A950a6fdA35d8422539C65Cd7B37016f974764B2": { "balance": "1000000000000000000" },
  }
}
```

In `extradata`, you'll add the address of your Node 1 account without `0x` prefix and surrounded by zeros on each side.

### Step-3. Initialize Each Node with the Genesis Block

Run the following command for each node.

```sh
geth --datadir node1 init genesis.json
geth --datadir node2 init genesis.json
```

### Step-4: Start the Bootnode

The next step is to configure a bootnode. This can be any node, but for this tutorial the developer tool bootnode will be used to quickly and easily configure a dedicated bootnode. First the bootnode requires a key, which can be created with the following command, which will save a key to boot.key:

```sh
bootnode -genkey boot.key
```

This key can then be used to generate a bootnode as follows:

```sh
bootnode -nodekey boot.key -addr :30305
```

Set enode from the console output into node.sh scripts

### Step-5: Connect Nodes
   
In `node1.sh` and `node2.sh` set `bootnodes`, `unlock`, `miner.etherbase`.

Run nodes by running scripts in separate terminals.

### Step-7: Verify the Connection

To verify Node 2 is connected to Node 1, attach a console to Node 2:

```sh
geth attach http://127.0.0.1:8555
```

Then check the peer count:

```
net.peerCount
```

If everything is set up correctly, you should see 1, indicating that Node 2 is connected to one peer (Node 1).

### Congratulations!

You've successfully set up a private Ethereum network using the Clique consensus algorithm. You can connect to the node using Metamask - use http://127.0.0.1:8555