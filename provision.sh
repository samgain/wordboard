echo '--> updating'
apt-get update -y

echo '--> installing dev tools'
apt-get install -y git apt-transport-https ca-certificates curl software-properties-common python-pip python-dev vim
pip install --upgrade pip
pip install pymongo

echo '--> installing docker'
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update -y
apt-get install =y docker-ce

echo '--> installing docker compose'
sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

echo '--> add user to docker group'
groupadd docker
usermod -aG docker vagrant

echo '--> add wordboard folder to python path'
export PYTHONPATH=$PYTHONPATH:/wordboard

echo '--> all done'