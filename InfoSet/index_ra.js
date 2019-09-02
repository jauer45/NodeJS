const rp = require('request-promise');
const $ = require('cheerio');

const url = 'https://www.residentadvisor.net/dj.aspx?area=191&country=30';
// const uri_request = 'https://www.douban.com/wetware/?lang=en';
// package installs : $ npm install --save request request-promise cheerio puppeteer

/* 
   Usage: ~$ node index_ra.js  > RA.json
   Ref: https://www.freecodecamp.org/news/the-ultimate-guide-to-web-scraping-with-node-js-daa2027dcd3/

   How to get the element attribute(s) we want to get:
	1) In the Chrome browser, go to the webpage we want to parse.
	2) Open the 'More Tools' -> 'Developers Tools' window.frame.
	   Check to see the 'Elements' HTML inspector toolbar option
	   is selected. 
	3) Use the select an element to inspect icon option in the toolbar
	   (on the far left of the toolbar), to roll-over the thing you
	   looking to get (in this case - the dj reference www page
	   attribute(s)).
	4) Once selected, check the nested HTML data logic to construct
	   the function(html) { return attribs request } . The request
	   will tell us the array lenth of which a loop can run through
	   all the attributes and populate an JSON list array for output. 

	NOTE: I ran the following to get a quick overview of the HTML
		structure that makes up a RA web page display :

			$ node parse_json.js >> RADatadump

*/


rp (url)
	.then(function(html) {
		// Find the HTML attribute data storage logic first to get the array length, (this length is the for loop limit). The output is returned in a JSON array list.

		// console.log($('span > a', html).length);
		// console.log($('span > a', html));

		const wikiUrls = [];
		for (let i = 0; i < 69; i++) 
		{
			wikiUrls.push($('span > a', html)[i].attribs.href);
		}
		console.log(wikiUrls);

	})
	.catch(function(err) {
		// console.log(err);
	});

