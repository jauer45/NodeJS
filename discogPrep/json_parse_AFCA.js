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

fs.readFile('AFCA.json', 'utf8', function(err, data) {
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
	// console.log(obj.Asia[0].South_Asia); // Traversing the nested JSON obj
	// console.log(obj.Asia[1].North_Asia);
	// console.log(obj.Asia[2].Southeast_Asia);
	// console.log(obj.Asia[3].East_Asia);
	// console.log(obj.Asia[0].South_Asia.length);


	/*
	for (var a=0; a < obj.Asia.length; a++)
	{
		console.log("Region: " + obj.Asia[a]);
	}
	*/

	for (var h=0; h < obj.Africa[0].Eastern_Africa.length; h++)
        {
                console.log(obj.Africa[0].Eastern_Africa[h]);
        }

	for (var i=0; i < obj.Africa[1].Middle_Africa.length; i++)
	{
		console.log(obj.Africa[1].Middle_Africa[i]);
	}

	for (var j=0; j < obj.Africa[2].Northern_Africa.length; j++)
	{
		console.log(obj.Africa[2].Northern_Africa[j]);
	}

	for (var k=0; k < obj.Africa[3].Southern_Africa.length; k++)
        {
                console.log(obj.Africa[3].Southern_Africa[k]);
        }

	for (var l=0; l < obj.Africa[4].Western_Africa.length; l++)
        {
                console.log(obj.Africa[4].Western_Africa[l]);
        }

	
	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);

});
