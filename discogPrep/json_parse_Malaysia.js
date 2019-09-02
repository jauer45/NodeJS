var fs = require("fs");


/*
	A good reference for a wide variety of ways to parse JSON using UNIX toolsets
	is here: https://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools?rq=1
*/

fs.readFile('Malaysia.json', 'utf8', function(err, data) {
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
	console.log(obj);

	/*
	for (var a=0; a < obj.Asia.length; a++)
	{
		console.log("Region: " + obj.Asia[a]);
	}

	for (var i=0; i < obj.Asia[0].South_Asia.length; i++)
	{
		console.log(obj.Asia[0].South_Asia[i]);
	}
	*/

	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);
});
