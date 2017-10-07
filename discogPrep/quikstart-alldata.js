var Discogs = require('disconnect').Client;


var START = 8028400; // 950100;
var END =   8028500; // 950200;


for (var i=START; i < END; i++)
{
  var id = i;
  var db = new Discogs().database();

  db.getRelease(id, function(err, data) 
  {
	if (data != null)
	{
		console.log(data);
	}
  });

}

