var stats = require('blockchain.info/statistics');
var statObj = stats.get('20d');
console.log("Stats: " + JSON.stringify(statObj));
