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

fs.readFile('EURO.json', 'utf8', function(err, data) {
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
	// console.log(obj.Europe[0].South_Asia); // Traversing the nested JSON obj
	// console.log(obj.Europe[1].North_Asia);
	// console.log(obj.Europe[2].Southeast_Asia);
	// console.log(obj.Europe[3].East_Asia);
	// console.log(obj.Europe[0].South_Asia.length);

	/*
	for (var a=0; a < obj.Asia.length; a++)
	{
		console.log("Region: " + obj.Asia[a]);
	}
	*/

	for (var i=0; i < obj.Europe[0].Eastern_Europe.length; i++)
	{
		console.log(obj.Europe[0].Eastern_Europe[i]);
	}

	for (var j=0; j < obj.Europe[1].Northern_Europe.length; j++)
	{
		console.log(obj.Europe[1].Northern_Europe[j]);
	}

	for (var k=0; k < obj.Europe[2].Southern_Europe.length; k++)
        {
                console.log(obj.Europe[2].Southern_Europe[k]);
        }

	for (var l=0; l < obj.Europe[3].Western_Europe.length; l++)
        {
                console.log(obj.Europe[3].Western_Europe[l]);
        }

	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);
});
