// A Convenience function Usage: 
// var tower = require('voxel-tower')(game)
// 
// If doing module.exports = Tower then the usage would 
// have to be :
// var Tower require('vexel-tower')
// var tower = new Tower()

module.exports = function(game, opts)
{
	return new Tower(game, opts)
}

// Set global access contructor so Tower may be
// vailable to access prototype methods,...
module.exports.Tower = Tower


function Tower(game, opts)
{
	if(!(this instanceof Tower)) return new Tower(game, opts)

	this.game = game
	this.opts = opts || {}
	this.height = this.opts.height || 5
	this.material = this.opts.material || 'brick'
}


// Create a stack of voxels. Usage:
//	var Tower = require('voxel-tower')(game, {height: 5})
// 	tower.place([5, 30, 0])
Tower.prototype.place = function(position)
{
	for (var i = 1; i < this.height + 1; i++)
	{
		var pos = [position.x, position.y + 1, position.z]
		this.game.setBlock(pos, this.material)
	}

}
