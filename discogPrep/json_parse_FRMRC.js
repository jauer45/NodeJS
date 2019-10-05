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

fs.readFile('FRMRC.json', 'utf8', function(err, data) {
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
	// console.log(obj.FRMRC); // Traversing the nested JSON obj
	// console.log(obj.Asia[1].North_Asia);
	// console.log(obj.Asia[2].Southeast_Asia);
	// console.log(obj.Asia[3].East_Asia);
	// console.log(obj.Asia[0].South_Asia.length);


	
	for (var a=0; a < obj.FRMRC[0].Asia.length; a++)
	{
		console.log(obj.FRMRC[0].Asia[a]);
	}

	
	for (var h=0; h < obj.FRMRC[1].Africa.length; h++)
        {
                console.log(obj.FRMRC[1].Africa[h]);
        }


	for (var i=0; i < obj.FRMRC[2].Europe.length; i++)
        {
                console.log(obj.FRMRC[2].Europe[i]);
        }

	
	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);

});
