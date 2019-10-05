var Discogs = require('disconnect').Client;

// Usage: $ x=100; y=1200; for i in (${x}...${y}); do node quikstart-shellexec.js ${i}; sleep 10; done; 
const args = process.argv;
// console.log(args[2]);

var id = args[2];
/* 

 Previous cmd exec usage (without styles and discog data id): $ node quikstart.js >> FLAT_LATERDB
 New style cmd exec usage (with styles and discog data id): node quikstart.js >> FLAT_ADDSIDDB
 (to run the old style script exec cmd usage: $ node quikstart-old.js >> FLAT_LATERDB)

*/

  // console.log(id);

  var db = new Discogs().database();
  db.getRelease(id, function(err, data) 
  {
	// console.log(data);
	// if( data != null && data.community != null && data.community.submitter != 'undefined')
	// {
	//   console.log(data.community.submitter);
	// }
	// console.log(i);
	// How to determine whether an object has a given property in JavaScript
		// : if(data.hasOwnProperty('styles') { console.log()

	if (data != null && data.hasOwnProperty('styles') && data.hasOwnProperty('genres') && data.genres != 'undefined' && data.styles != 'undefined' && data.released ) // && data.country == 'Japan')
	{
	   
	   console.log(data.id + '::' + data.released + '::' + data.labels[0].name + '::' + data.artists[0].name + '::' + data.country + '::' + data.genres[0] + '::' + data.styles[0]); //Styles and id recording added: 19/08/2019
	}
	else
	{
		console.log("Issue with Entry");
	}

  });

  // Check to see if we can gracefully drop the discogs db object on exec end
