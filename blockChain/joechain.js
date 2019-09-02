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
	}

	calculateHash()
	{
		return SHA256(this.index + this.previousHash + this.timestamp + JSON.stringify(this.data)).toString();
	}

}


class Blockchain
{
	constructor ()
	{
		this.chain = [this.createGenesisBlock()];
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
		// No Proof-of-work 
		newBlock.hash = newBlock.calculateHash();
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
joecoin.addBlock(new Block(1, "10/08/2017", {amount: 4}));
joecoin.addBlock(new Block(2, "10/08/2017", {amount: 8}));
joecoin.addBlock(new Block(3, "12/09/2017", {amount: 11}));


console.log(JSON.stringify(joecoin, null, 4));


console.log('Is blockchain valid: ' + joecoin.isChainValid());

joecoin.chain[1].data = {amount: 100};
joecoin.chain[1].hash = joecoin.chain[1].calculateHash();

console.log('Is blockchain valid: ' + joecoin.isChainValid());

//console.log(JSON.stringify(joecoin, null, 4));
//
// Simple demo of a simple blockchain arch (needs distro checks and 
//        wallet currency add/sell to be valid bitcoin blockchain)
// This is just a run through of : https://www.youtube.com/watch?v=zVqczFZr124
// This is an good example of a linked-list in js as well.
//


