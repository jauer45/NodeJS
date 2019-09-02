// use 'strict';

const { Composer } = require('./Composer.js');
const { Blockchain, Block } = require('./Blockchain.js');

let sndcoin = new Blockchain();
let cmposer = new Composer();

var newargv = {};
var stime, etime, tdiff, bcounter, nlist;
var snotes = 4;
var argv = process.argv.slice(2);
if (argv.length > 1) 
{
    // we are going to say that we : BlocksToSet(num)

   for(var i = 0; i < argv.length; i++ ) 
   {
     if( argv[i] == '-b')
     { 
     	var wdate = '0' + argv[i + 1]  + '/07/2017';
     	stime = new Date().getTime();
    	  console.log("Mining Block " + argv[i + 1] + "...");
    	  sndcoin.addBlock(new Block(i, wdate, {amount: (2 + argv[i + 1])}));
     	etime = new Date().getTime();
     	tdiff = (this.entime - this.stime);

  	nlist = tdiff.toString().substring(0, snotes);
	console.log("nlist: " + nlist.length);
     }
   }

   // Blockchain affects/determines new sound composition and composition
   // determines Next Blockchain HASH link...
   //
   // -n:  cmposer.notes_update(x) 
   // -o: .octave_update 
   // -p: .pattern_update 
   // -a: .accentMap_update
   // -e: .arapeggio_update
   // -r: .repeat_update
   // -s: .sizzle_update
   // -f: .filename_update ??? 

   cmposer.scribblr_run(argv); // track N // *_run(newargv)

}
else
{
	console.log(cmposer.help_list() );
}



function set_midifile()
{
}

//
// Safety of a blockchain; preventing "spamming"/overloading the blockchain.
// Prevent tampering of the blockchain
// (The process of securing the above is called "Mining")
// (Difficuly is used to slow down the generation of the HASH; the
//  difficulty is set by taking the X amount of chars of the block hash;
//  the a difficulty of 5 means take the first five chars of the block hash)
//

