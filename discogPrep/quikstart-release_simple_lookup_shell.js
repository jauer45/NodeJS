var Discogs = require('disconnect').Client;

// Just a single release (as given by ID), lookup
// Discogs API ref is here : https://www.discogs.com/developers#page:database
// 	API contains the GET functions and more required to construct a
//	a view of various hierarchy types from social relations to more
//	abstracted datas. 
//		This test lookup checks the release GET and RETURN functions

const args = process.argv;
console.log(args[2]);

var id = args[2]; // 9261182;
// console.log(id);

var db = new Discogs().database();
db.getRelease(id, function(err, data) 
{
	// console.log(data);

	if( data != null && data.country != 'undefined')
	{
		console.log('Release Info: ' + data.country + ' , ' + data.title + ' , ' + data.id + ' , ' + data.uri);

		if( data.hasOwnProperty('released') )
		{
			console.log('Year Released: ' + data.released + ' , ' + data.year);
		} 
	
		if( data.hasOwnProperty('artists') && data.artists[0].id != 'undefined') 
		{
			console.log('Artist Info: ' + data.artists[0].id + ' , ' + data.artists[0].resource_url);
		}

		if( data.hasOwnProperty('labels') )
		{
			console.log('Label Info: ' + data.labels[0].id + ' , ' + data.labels[0].resource_url);
		}

		if( data.hasOwnProperty('companies') && data.companies[0] != 'undefined' )
		{
			console.log('Company Info: ' + data.companies[0].name);
		}

		if( data.hasOwnProperty('community'))
		{
			console.log('Discogs Community: ' );
		}

		if( data.hasOwnProperty('genres') )
		{
			console.log('Genre: ' + data.genres );
		}

		if( data.hasOwnProperty('formats') )
		{
			console.log('Formats: ' + data.formats[0].name );
		}

	}

});
