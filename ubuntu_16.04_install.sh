# Install couchdb
curl -L https://couchdb.apache.org/repo/bintray-pubkey.asc | sudo apt-key add -
echo "deb https://apache.bintray.com/couchdb-deb xenial main" | sudo tee -a /etc/apt/sources.list
sudo apt update && sudo apt install -y couchdb

# Install node both version 6.x
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
sudo apt install -y nodejs

# Git
sudo apt install -y git

# Get source code
git clone https://gitlab.com/caleb3141/financier.git

#Get npm
sudo apt install -y npm

# Setup couchdb
cd financier
npm install
node ./install/setup_couchdb.js

# Build
npm run build

# Install node both version 10.x
curl -sL https://deb.nodesource.com/setup_10.x | sudo -E bash -
sudo apt install -y nodejs

# Daemonize
sudo npm install -g npm
sudo npm install pm2 -g
sudo pm2 startup
sudo pm2 start ./api/index.js

ip=$(ip -f inet -o addr show eth0|cut -d\  -f 7 | cut -d/ -f 1)

echo ""
echo ""
echo "#################################################################"
echo ""
echo "If there were not any errors above, you can go to the following"
echo "url in your browser to load financier!"
echo ""
echo "http://$ip:8080"
echo ""
echo "#################################################################"
