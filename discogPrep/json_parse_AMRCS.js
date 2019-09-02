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

fs.readFile('AMRCS.json', 'utf8', function(err, data) {
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
	// console.log(obj.Americas[0].South_Asia); // Traversing the nested JSON obj
	// console.log(obj.Americas[1].North_Asia);
	// console.log(obj.Americas[2].Southeast_Asia);
	// console.log(obj.Americas[3].East_Asia);
	// console.log(obj.Americas[0].South_Asia.length);


	/*
	for (var a=0; a < obj.Americas.length; a++)
	{
		console.log("Region: " + obj.Americas[a]);
	}
	*/

	for (var i=0; i < obj.Americas[0].Caribbean.length; i++)
	{
		console.log(obj.Americas[0].Caribbean[i]);
	}

	for (var j=0; j < obj.Americas[1].Central_America.length; j++)
	{
		console.log(obj.Americas[1].Central_America[j]);
	}

	for (var k=0; k < obj.Americas[2].South_America.length; k++)
        {
                console.log(obj.Americas[2].South_America[k]);
        }

	for (var l=0; l < obj.Americas[3].Northern_America.length; l++)
        {
                console.log(obj.Americas[3].Northern_America[l]);
        }

	
	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);
});
