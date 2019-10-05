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

fs.readFile('APAC.json', 'utf8', function(err, data) {
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

	// console.log(obj.Oceania[0].Australasia);
	// console.log(obj.Oceania[1].Melanesia);
	// console.log(obj.Oceania[2].Micronesia);
	// console.log(obj.Oceania[3].Polynesia);

	/*
	for (var a=0; a < obj.Asia.length; a++)
	{
		console.log("Region: " + obj.Asia[a]);
	}
	*/

	for (var i=0; i < obj.Asia[0].South_Asia.length; i++)
	{
		console.log(obj.Asia[0].South_Asia[i]);
	}

	for (var j=0; j < obj.Asia[1].North_Asia.length; j++)
	{
		console.log(obj.Asia[1].North_Asia[j]);
	}

	for (var k=0; k < obj.Asia[2].Southeast_Asia.length; k++)
        {
                console.log(obj.Asia[2].Southeast_Asia[k]);
        }

	for (var l=0; l < obj.Asia[3].East_Asia.length; l++)
        {
                console.log(obj.Asia[3].East_Asia[l]);
        }

	for (var m=0; m < obj.Asia[4].Central_Asia.length; m++)
        {
                console.log(obj.Asia[4].Central_Asia[m]);
        }

	// Oceania
	 for (var i=0; i < obj.Oceania[0].Australasia.length; i++)
        {
		if ( i == 0 ) { console.log("Australia") }
		if ( i == 1 ) { console.log("New Zealand")}

		// Length
		if( obj.Oceania[0].Australasia[i].Australia )
		{
			// console.log(obj.Oceania[0].Australasia[i].Australia.length);
			for(var x=0; x < obj.Oceania[0].Australasia[i].Australia.length; x++ )
			{
				console.log(obj.Oceania[0].Australasia[i].Australia[x]);
			}
		}
        }

        for (var j=0; j < obj.Oceania[1].Melanesia.length; j++)
        {
                console.log(obj.Oceania[1].Melanesia[j]);
        }

        for (var k=0; k < obj.Oceania[2].Micronesia.length; k++)
        {
		if ( k == 0 ) 
		{ 
		  for(var x=0; x < obj.Oceania[2].Micronesia[k].US.length; x++ )
                  {
                    console.log(obj.Oceania[2].Micronesia[k].US[x]);
                  }	
		}		
		else { console.log(obj.Oceania[2].Micronesia[k]); }
        }

        for (var l=0; l < obj.Oceania[3].Polynesia.length ; l++)
        {
		if ( l == 0 ) 
		{ 
		  for(var x=0; x < obj.Oceania[3].Polynesia[l].US.length; x++ )
                  {
                    console.log(obj.Oceania[3].Polynesia[l].US[x]);
                  } 
		}
		else if( l == 1 ) 
		{
			/*
		  console.log("NZ-Territory")
		  for(var x=0; x < obj.Oceania[3].Polynesia[l]."New Zealand".length; x++ )
                  {
                    console.log(obj.Oceania[3].Polynesia[l]."New Zealand"[x]);
                  } 
			*/
		}
		else if( l == 2 ) 
		{ 
		  for(var x=0; x < obj.Oceania[3].Polynesia[l].France.length; x++ )
                  {
                    console.log(obj.Oceania[3].Polynesia[l].France[x]);
                  }
		}
		else if( l == 3 ) 
		{  
		  for(var x=0; x < obj.Oceania[3].Polynesia[l].UK.length; x++ )
                  {
                    console.log(obj.Oceania[3].Polynesia[l].UK[x]);
                  }
		}
                else { console.log(obj.Oceania[3].Polynesia[l]); }
        }

	
	// console.log(obj.identifiers.length);
	// console.log(obj.identifiers[2].type);

});
