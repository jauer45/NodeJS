var fs = require("fs");

/*
	Need to know more abbout the JSON formatting as there must be a reason for
	the current Discogs JSON formmatted output not to conform properly to JSON
	parsing standads assumed by node/javasript's JSON object parse function.

	Currently, I need to convert outputted discogs JSON into standardised parsable 
	form. This is not good. 

	A good reference for a wide variety of ways to parse JSON using UNIX toolsets
	is here: https://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools?rq=1
	
*/

var wrlist = ["AFCA.json","AMRCS.json","APAC.json","EURO.json"];
for(var i = 0; i < wrlist.length; i++ )
{
	rf(wrlist[i]);
	// sleep(1);
}

function rf (fl)
{
  var jsonfl = fl  

  fs.readFile(jsonfl, 'utf8', function(err, data) 
  {
	// fs.readFile('package.json', 'utf8', function(err, data) {
	if (err) throw err;

	data = data.replace(/\\n/g, "\\n")
		.replace(/\\'/g, '\\"')
		.replace(/\\"/g, '\\"')
		.replace(/\\&/g, "\\&")
		.replace(/\\r/g, "\\r")
		.replace(/\\t/g, "\\t")
		.replace(/\\b/g, "\\b")
		.replace(/\\f/g, "\\f")
		.replace(/[\u0000-\u001F]+/g, "");
	
	var obj = JSON.parse(data);
	// console.log(obj);

	for ( var key in obj )
	{
		console.log("Region: " + key);
		// console.log("A country called by object: " + obj[key].toString());
		// console.log("Region2: " + obj[key]);
		for (var i = 0; i < obj[key].length; i++)
		{
			console.log(obj[key][i]);
			console.log("Region Divisions: " + obj[key][i]);

			for ( var keysub in obj[key][i] )
			{
				console.log("Region Division: " + keysub);
				
				for (var j = 0; j < obj[key][i][keysub].length; j++)
				{
				//	console.log(obj[keysub][i]);
				}
				
			}
		} 
	}

	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);
   });
}
