var Discogs = require('disconnect').Client;

var db = new Discogs().database();
db.getRelease(10288186, function(err, data) {
	console.log(data);
	console.log(data.country + '::' + data.genres[0]);

});

