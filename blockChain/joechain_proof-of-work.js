const SHA256 = require('crypto-js/sha256');

class Block
{
	constructor (index,timestamp, data, previousHash = '')
	{
		this.index = index;
		this.timesatamp = timestamp;
		this.data = data;
		this.previousHash = previousHash;
		this.hash = this.calculateHash();
		this.nonce = 0;
	}

	calculateHash()
	{
		return SHA256(this.index + this.previousHash + this.timestamp + JSON.stringify(this.data) + this.nonce).toString();
	}

	mineBlock(difficulty)
	{
		while( this.hash.substring(0, difficulty) !== Array(difficulty + 1).join("0") )
		{
			this.nonce++;
			this.hash = this.calculateHash();
		}

		console.log("Block Mine: " + this.hash);
	}

}


class Blockchain
{
	constructor ()
	{
		this.chain = [this.createGenesisBlock()];
		this.difficulty = 4; // 2 is too fast ! Add 2 more zeros
	}
	
	createGenesisBlock()
	{
		return new Block(0, "01/07/2017", "Genesis Block", "0");
	}

	getLatestBlock()
	{
		return this.chain[this.chain.length - 1];
	}

	addBlock(newBlock)
	{
		newBlock.previousHash = this.getLatestBlock().hash;
		// New: mineBlock
		newBlock.mineBlock(this.difficulty);

		// Original: non mineBlock 
		// newBlock.hash = newBlock.calculateHash();
		this.chain.push(newBlock);
	}


	isChainValid()
        {
                for(let i = 1; i < this.chain.length; i++)
                {
                        const currentBlock = this.chain[i];
                        const previousBlock = this.chain[i - 1];

                	if(currentBlock.hash !== currentBlock.calculateHash())
                	{
                        	return false;
                	}


                	if(currentBlock.previousHash !== previousBlock.hash)
                	{
                        	return false;
                	}

			// console.log(i);
		}

                return true;
        }
}

let joecoin = new Blockchain();

console.log("Mining Block 1...")
joecoin.addBlock(new Block(1, "10/08/2017", {amount: 4}));

console.log("Mining Block 2...");
joecoin.addBlock(new Block(2, "10/08/2017", {amount: 8}));

console.log("Mining Block 3...");
joecoin.addBlock(new Block(3, "12/09/2017", {amount: 11}));

//
// Safety of a blockchain; preventing "spamming"/overloading the blockchain.
// Prevent tampering of the blockchain
// (The process of securing the above is called "Mining")
// (Difficuly is used to slow down the generation of the HASH; the
//  difficulty is set by taking the X amount of chars of the block hash;
//  the a difficulty of 5 means take the first five chars of the block hash)
//
