# NodeJS


Git Directory Layout:

  + bundle (contains) :
  	- bitcoinEx_package.json
	  + views (directory) :
	  	*.html (files)

	- bitcoinLib_package.json

	- blockChain_package.json

	- discTest_package.json

	- linkinRel_package.json

	- oscWeb_package.json

	- srcTest_package.json

	- testapp_package.json

	- voxelExample_package.json


	(shell Builder - TODO)
	- build.sh (BASH script install):
		- Creates ${name}_package.json sub-directory NodeJS/${name}
		- cd NodeJS/${name} and run:
			$ npm install [npm_module_list] --save
			(reason for --save is possible mod update)



Prerequisits:

	- Install latest version of node.js
	- Install latest version of GiT (require Git BASH for Windows
	- npm install mocha --global (mocha test env)
	- ???


