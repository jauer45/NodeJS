'use strict';

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
		this.vcounter = " ";
		this.stime;
		this.entime;
	}

	calculateHash()
	{
		return SHA256(this.index + this.previousHash + this.timestamp + JSON.stringify(this.data) + this.nonce).toString();
	}

	getDateTimeNow()
	{
		return (this.entime - this.stime);
	}

	advanceVCounter()
	{
		return (' * ');
	}

	mineBlock(difficulty)
	{
		this.stime = new Date().getTime();

		while( this.hash.substring(0, difficulty) !== Array(difficulty + 1).join("0") )
		{
			this.nonce++;
			this.hash = this.calculateHash();
		}

		this.entime = new Date().getTime();

		console.log("Block Mine: " + this.hash);
	}

}


class Blockchain
{
	constructor ()
	{
		this.chain = [this.createGenesisBlock()];
		this.difficulty = 5; // 2 is too fast ! Add 2 more zeros
		this.datetime = 0;
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

		this.datetime = newBlock.getDateTimeNow();
		this.logMsg("Time to set New Block: " + this.datetime);

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
                        	return (false);
                	}


                	if(currentBlock.previousHash !== previousBlock.hash)
                	{
                        	return (false);
                	}

		}

                return (true);
        }

	logMsg(val)
	{
		console.log(val);
	}
}


module.exports = {
        Blockchain: Blockchain,
        Block: Block
}

