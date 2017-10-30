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


app.get("/", function(req, res)
{
	res.sendFile(__dirname + "/app3.html");
});


app.post("/wallet", function(req, res)
{
	var brainsrc = req.body.brainsrc; // from the user
	console.log(brainsrc);
	var input = new Buffer(brainsrc);
	var hash = bitcore.crypto.Hash.sha256(input);
	var bn = bitcore.crypto.BN.fromBuffer(hash);

	var pk = new bitcore.PrivateKey(bn).toWIF();
	var addr = new bitcore.PrivateKey(bn).toAddress();

	// Address access check : https://blockchain.info/address/147LUNr7QqnuPwHjCED3ryQqyMTq3jeAFe
	res.send("Brain Wallet of: " + brainsrc + "<br> Address: " + addr + 
			"<br>Private Key: " + pk);



	// Used without bitcore-lib HASH
	// res.send("complete " + brainsrc);
});

app.listen(8095, function()
{
	console.log("go");
});

