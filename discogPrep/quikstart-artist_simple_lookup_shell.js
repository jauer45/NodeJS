var Discogs = require('disconnect').Client;

// Just a single artist (as given by ID), lookup
// Discogs API ref is here : https://www.discogs.com/developers#page:database
// 	API contains the GET functions and more required to construct a
//	a view of various hierarchy types from social relations to more
//	abstracted datas. 
//		This test lookup checks the Artist GET and RETURN functions

const args = process.argv;
console.log(args[2]);

var id = args[2]; //933018;
// console.log(id);

var db = new Discogs().database();
db.getArtist(id, function(err, data) 
{
	// console.log(data);
	// if( data != null && data.community != null && data.community.submitter != 'undefined')
	// {
	//   console.log(data.community.submitter);
	// }
	// console.log(i);
	//
	// if (data != null && data.genres != 'undefined' && data.released ) // && data.country == 'Japan')
	//
	// {
	//   console.log(data.released + '::' + data.labels[0].name + '::' + data.artists[0].name + '::' + data.country + '::' + data.genres[0]);
	// }

	if( data != null && data.resource_url != 'undefined' && data.artists != 'undefined')
	{
		console.log(data.uri + ' ' + data.profile + ' ' + data.resource_url + ' ' + data.members);

		

		if( data.hasOwnProperty('members') && data.members.length > 0 ) 
		{
			for(var i = 0; i < data.members.length; i++)
			{
				console.log('Member: ' + data.members[i].active + ' , ' + data.members[i].id + ' , ' + data.members[i].name);
			}
		}

	
	}

});

db.getArtistReleases(id , function(err, data)
{
	if (data != null)
	{
		console.log( 'No of releases: ' + data.releases.length );
		if ( data.releases.length > 0 )
		{
			for(var i = 0; i < data.releases.length; i++ )
			{
				if( data.releases[i].year != null )
				{ 
					console.log( i + ': ' + data.releases[i].label + ' , ' + data.releases[i].title + ' , ' + data.releases[i].resource_url + ' , ' + data.releases[i].year);
				}
				else
				{
					console.log( i + ': ' + data.releases[i].label + ' , ' + data.releases[i].title + ' , ' + data.releases[i].resource_url);
				}
			}
		}
	}
});

