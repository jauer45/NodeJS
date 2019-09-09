var fs = require("fs");

/*
	A good reference for a wide variety of ways to parse JSON using UNIX toolsets
	is here: https://stackoverflow.com/questions/1955505/parsing-json-with-unix-tools?rq=1
*/

fs.readFile('Indonesia_Admin.json', 'utf8', function(err, data) {
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
	// console.log(obj.Indonesia.Region);
	// console.log(obj.Indonesia.Region.keys);
	console.log(obj.Indonesia.Region);

	if( obj.Indonesia.Region.hasOwnProperty('City') )
	{
	console.log("\t\t HERE: " + obj.Indonesia.Region.City[0].length);;
	}
	
	for ( var regn in obj.Indonesia.Region)
	{
		console.log(regn + " " + obj.Indonesia.Region[regn]);

		
		for ( var regattr in obj.Indonesia.Region[regn])
		{
			console.log("\t" + regattr + " " + obj.Indonesia.Region);
			// console.log("\t\t" + obj.Indonesia.Region.Music);
		}
	
	
		/*	
		if (obj.Indonesia.Region[regn].length > 0)
		{
			for (var x in obj.Indonesia.Region[regn].regn[] )
			{
				console.log(x);	
			}
		}
		*/
	}

	/*
	for (var a=0; a < obj.Indonesia.Region.length; a++)
	{
		console.log("Region: " + obj.Indonesia.Region[a]);
	}

	for (var i=0; i < obj.Asia[0].South_Asia.length; i++)
	{
		console.log(obj.Asia[0].South_Asia[i]);
	}


        for (var a=0; a < obj.Asia.length; a++)
        {
                console.log("Region: " + obj.Asia[a]);
        }
	
	*/

	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);
});
