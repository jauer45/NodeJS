var express = require("express");
var app = express();

var request = require("request");
var bodyparser = require("body-parser");
var bitcore = require("bitcore-lib");



app.use(bodyparser.urlencoded(
{
	extended: true
}));
app.use(bodyparser.json());


app.set("view engine", "ejs");


// Deff: brainWallet(uInput,*CALLBACK FUNCTION);
//
function brainWallet(uInput, callback)
{
	var input = new Buffer(uInput);
        var hash = bitcore.crypto.Hash.sha256(input);
        var bn = bitcore.crypto.BN.fromBuffer(hash);
        var pk = new bitcore.PrivateKey(bn).toWIF();
        var addr = new bitcore.PrivateKey(bn).toAddress();

	callback(pk, addr);
}


// Request Callback Function Set
function getPrice(returnPrice)
{
	request(
	{
		url: "https://blockchain.info/stats?format=json",
		json: true
	},
 	 function (err, res, body)
	  {
		returnPrice(body.market_price_usd); // Get the current Price
	});

}


app.get("/", function(req, res)
{
	getPrice(function(lastPrice)
	{
		// Old style call : res.sendFile(__dirname + "/app3.html");
		res.render("index", 
		{
			lastPrice: lastPrice
		});
	});
});

app.get("/brain", function(req, res)
{
	getPrice(function(lastPrice)
        {
                res.render("brain",
                {
                        lastPrice: lastPrice
                });
        });
});

app.get("/converter", function(req, res)
{
	getPrice(function(lastPrice)
        {
                // Old style call : res.sendFile(__dirname + "/app3.html");
                res.render("converter",
                {
                        lastPrice: lastPrice
                });
        });
});


app.post("/wallet", function(req, res)
{
	var brainsrc = req.body.brainsrc; // from the user
	console.log(brainsrc);
	brainWallet(brainsrc, function(priv, addr_ )
	{
		// Address access check : 
		// https://blockchain.info/address/147LUNr7QqnuPwHjCED3ryQqyMTq3jeAFe
		//
        	res.send("Brain Wallet of: " + brainsrc + "<br> Address: " + addr_ +
                        	"<br>Private Key: " + priv);	
	});

});

app.listen(8095, function()
{
	console.log("go");
});

