var Discogs = require('disconnect').Client;

// Current setting has 2015 entries; less diverse Country submission set
// than I thought despite the scale of the DB; a bit counter-intuitive and
// a bit of a downer...
//
var START = 959600; // 950200;
var END =   959700; // 950300;

// 100 - 127100  (1996 - 2003; No entries for ROK, 10 for JP; None for other Asian countries)
// 137000 - "100 (") -- around here 12 for Japan
// 147000 - "100 (")
// 157000 - "100 (")
// 200000 - "100 (")
// 300000 - "100 (1996 - 2004 ")
// 400000 - "100 (1995 - 2005 ")
// 500000 - "800 (")
// 600000 - "500 (" + 13 for Japan)
// 700000 - "500 (1996 - 2006 ")
// 800000 - "200 (1996 - 2007 ") -- Australia : 2; Japan : 14
// 900000 - "900 (1996 - 2007 ") -- NZ, Aus, Jap (++)
// 901000 - "600 (") -- first China entry
// 902000 - "300 (") 
// 903000 - "500 (")
// 904000 - "400 (")
// 905000 - "500 (")
// 906000 - "500 (") 
// 907000 - "400 (")
// 910000 - "500 (")
// 911000 - "500 (")  -- somewhere here 2008 & 2009 appear
// 913000 - "300 (")
// 915000 - "200 (")
// 916000 - "500 (") -- Malaysia first appears at 200
// 917000 - "500 (")
// 918000 - "500 (")
// 919000 - "500 (") 
// 920000 - "300 (") -- still in 2007 mainly; FFWD a bit now...
// 921000 - "500 (") -- Accelerate now as nothing really happening...
// 950000 - 
// 8028000 - 8031200 -- Again, nothing happening much here (up to 2016)
// 8040000 - 8085000 -- Strange but other than Japan, no other ASEAN countries are having entries added, (currently the max year is 2017)
// 9000000 - 

// Much further on to around 2013 and I deccided to see again...
// Would I find a more diverse db input per country or the mono-
// lithic top 5 (US, UK, Ger, Fra, Spa)
// 5001000 - "500 (1996 - 2013)
// 5017000 - "300 (") -- "1st Philippino entry
// 5048100 - 100 (") -- "1st Thailand entry
// 5052300 - 200 (") -- "1st Indonesian Entry
// 5052500 - 500 (") -- "1st India entries (3 in total)
// 5075700 (END BIT)

// 7000000 - 7077600 (2014 - 2015 + 1 2016 entry)
//    Suprisingly, very little movement on the APAC countries;
//    standing out for me is that S. Korea has very few entries
//    at a time it's "culture industries" are very popular world over
//

// 8000000 - ?

/* 

 Previous cmd exec usage (without styles and discog data id): $ node quikstart.js >> FLAT_LATERDB
 New style cmd exec usage (with styles and discog data id): node quikstart.js >> FLAT_ADDSIDDB
 (to run the old style script exec cmd usage: $ node quikstart-old.js >> FLAT_LATERDB)

*/

for (var i=START; i < END; i++)
{
  var id = i;
  // var id = 1028818 + i;
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

  });

  // sleep 3; 

}

