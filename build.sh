# Currently not ready

# Setup the PD local from github
# cd C:/
# cd Joseph # Assume that git clone has been done ?
git clone https://github.com/jauer45/PD.git
git clone https://github.com/jauer45/PDII.git

# git clone https://github.org/jauer45/NodeJS.git

# Preparing/setting the package.json info for npm install support
# cp voxelExample/package.json package/voxelExample_package.json
# cp blockChain/package.json package/blockChain_package.json
# cp bitcoinEx/package.json package/bitcoinEx_package.json
# cp linkinRel/package.json package/linkinRel_package.json

# Install browserify
npm install -g browserify

# Get github package.json files to assemble local client
git clone https://github.com/jauer45/NodeJS.git
cd NodeJS/
mkdir voxelExample
cp package/voxelExample_package.json voxelExample/package.json
cat voxelExample/package.json
cd voxelExample/
echo 'var createGame = require('voxel-hello-world') ' . "\n" . 'var game = createGame()' >> mygame.js
browserify mygame.js -o builtgame.js
echo '
<!doctype html>
<html>
        <body>
                <script src="builtgame.js"></script>
        </body>
</html>' >> index.html
exit

