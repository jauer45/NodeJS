// __dirname is the current working directory; 
// it is passed into the painterly-textures module;
// it returns the path from here to where textures are located
//
var textures = require('painterly-textures')(__dirname)
var game = require('voxel-hello-world')({texturePath: textures})
var tower = require('./')(game)

// make a tower appear after 5 secs at player's position
setTimeout(function()
{
	tower.place(game.controls.target().avatar.position)
}, 5000)
