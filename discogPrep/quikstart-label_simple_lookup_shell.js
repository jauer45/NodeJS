var Discogs = require('disconnect').Client;

// Just a single label (as given by ID), lookup
// Discogs API ref is here : https://www.discogs.com/developers#page:database
// 	API contains the GET functions and more required to construct a
//	a view of various hierarchy types from social relations to more
//	abstracted datas. 
//		This test lookup checks the Label GET and RETURN functions

const args = process.argv;
console.log(args[2]);

var id = args[2]; // 1090784;
// console.log(id);

var db = new Discogs().database();
db.getLabel(id, function(err, data) 
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

	if( data != null )
	{
		console.log(data.name + ' , ' + data.profile + ' , ' + data.uri);
	
	
		if( data.hasOwnProperty('artists') && data.sublabels.length > 0 ) 
		{
			for(var i = 0; i < data.sublabels.length; i++)
			{
				console.log('Sub Label: ' + data.subelabels[i].id + ' , ' + data.sublabels[i].name);
			}
		}

		if( data.hasOwnProperty('urls') ) {

		if( data.urls.length > 0 )
		{
			for(var j = 0; j < data.urls.length; j++)
			{
				console.log(data.urls[j]);
			}
		} }
	}

});

db.getLabelReleases(id , function(err, data)
{
	if (data != null)
	{
		console.log( 'No of releases: ' + data.releases.length );
		if ( data.releases.length > 0 )
		{
			console.log('WWW Page Pagination data: ' + data.pagination.pages + ' ' + data.pagination.page + ' ' + data.pagination.items);
			

			for(var i = 0; i < data.releases.length; i++ )
			{
				if( data.releases[i].year != null && data.releases[i].resource_url )
				{ 
					console.log( i + ': ' + data.releases[i].artist + ' , ' + data.releases[i].id + ' , ' +  data.releases[i].resource_url + ' , ' +  data.releases[i].format + ' , ' + data.releases[i].year);
				}
				else
				{
					console.log( i + ': ' + data.releases[i].title + ' , ' + data.releases[i].resource_url);
				}
			}
		}
	}
});

