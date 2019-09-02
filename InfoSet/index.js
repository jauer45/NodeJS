const rp = require('request-promise');
const uri_request = 'https://en.wikipedia.org/wiki/List_of_new-age_music_artists';
// const uri_request = 'https://www.douban.com/wetware/?lang=en';


// Test execute: ~$ node index.js | grep '<li><a href' > list_uri_request
// Ref: https://www.freecodecamp.org/news/the-ultimate-guide-to-web-scraping-with-node-js-daa2027dcd3/


rp (uri_request)
	.then(function(html) {
		console.log(html);
	})
	.catch(function(err) {
		// console.log(err);
	});

