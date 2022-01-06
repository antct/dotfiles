#/bin/bash
wget https://github.com/antonmedv/fx/releases/download/20.0.2/fx-linux.zip
unzip fx-linux.zip
sudo mv fx-linux /usr/local/share/fx-linux
rm fx-linux.zip
sudo ln -s /usr/local/share/fx-linux/fx-linux /usr/local/bin/fx
