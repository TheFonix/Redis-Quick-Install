#Redis Download link address:
REDISLINK= "http://download.redis.io/redis-stable.tar.gz"

echo "Redis Installer - Fonix - 2017"
echo ""
echo "-------------------------------------------------"
echo "This is a super quick install script for Redis!"
  sleep 1
echo "Some things to note are:"
  sleep 1
echo "  - This is only tested on a fresh install of ubuntu 16.04"
  sleep 1
echo "  - I will no doubt not be updating this script to comply with redis updates!"
  sleep 1
echo "  - If any part of the script fails you should head over to the full installation guide!"
  sleep 1
echo "-------------------------------------------------"
echo ""
echo ""
  sleep 3

echo "Installation will begin in 5 seconds!"
sleep 5

echo "Running Apt-get update for you!"
sleep 1
sudo apt-get update

echo "Installing some dependencies!"
sleep 1
sudo apt-get install build-essential tcl -y

echo "Create file paths and download latest version of Redis from the Offical Repo"
sleep 2
mkdir -p /tmp
cd /tmp

echo "Download the latest Redis file"
sleep 2
curl -O $REDISLINK

echo "Unzipping the archive"
sleep 1
tar xzvf redis-stable.tar.gz
cd redis-stable

echo "Run make files This could take awhile! Go grab something to drink!"
sleep 3
make
make test
sudo make install

echo "Creating the Redis info directories"
sleep 1
sudo mkdir /etc/redis

echo "Copy exmaple files to the correct location!"
sudo cp /tmp/redis-stable/redis.conf /etc/redis
sleep 1

echo "Go to the system service directory! and place the default config in there"
mkdir -p /etc/systemd/system/
cd /etc/systemd/system/
wget https://fonix.online/repo/redis.service

echo "Create the system users"
sudo adduser --system --group --no-create-home redis
sleep 1

echo "Make the Redis library file"
sudo mkdir /var/lib/redis
sleep 1

echo "Set default permissions"
sudo chown redis:redis /var/lib/redis
sudo chmod 770 /var/lib/redis
sleep

echo "Attempting to start redis for you"
sudo systemctl start redis
sleep 1

echo "Hopefully that worked! Here is the current status of the redis server!"
sudo systemctl status redis