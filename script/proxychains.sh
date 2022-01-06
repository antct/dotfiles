#/bin/bash
#git clone https://github.com/rofl0r/proxychains-ng
git clone https://ghproxy.com/https://github.com/rofl0r/proxychains-ng
cd proxychains-ng
./configure --prefix=/usr --sysconfdir=/etc
make
sudo make install
sudo make install-config
cd ..
rm -rf proxychains-ng
