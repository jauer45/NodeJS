var http = require("http");
var request = require("request");


var status = http.createServer(function (req, res)
{

	request ( 
	{
		url: "https://forex.1forge.com/1.0.2/convert?from=EUR&to=USD&quantity=1&api_key=TKQ1iKR9tGYZ4elpm1v1Jo0gEpQpnbkk"
	},
	 function(error, response, body)
	{
		var fval = JSON.parse(body);
		console.log(fval.value);
	});

	res.end("OK");

}).listen(8095);
