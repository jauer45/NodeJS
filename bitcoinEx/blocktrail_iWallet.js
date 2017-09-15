var key = "787bb7131c93d137b52480b9c4ace4614544dfd7";
var secret = "9b58712ca60c938380f47b1ba617453a727a16aa";

blocktrail = require('blocktrail-sdk');
client = blocktrail.BlocktrailSDK(
	{apiKey: key, 
	 apiSecret: secret, 
	 network: "BTC", 
	 testnet: false});


client.initWallet("myWallet", "myPassword",
    function(err, wallet) 
    {
	wallet.getNewAddress(function(err, address) 
	{
		console.log(address);
	});	
    });
