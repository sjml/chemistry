#!/bin/bash

# If you've already run the installation script, this will update your platon to the latest
# version from the website.
#
# You can run this automatically by opening the terminal and pasting the following line:
#     /bin/bash -c "$(curl -fsSL https://gist.githubusercontent.com/sjml/e64b836fbc87730cc2ffa01a192160c5/raw/update-platon.sh)"

cd $HOME/platon
mkdir -p tmp
cd tmp

curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/platon.f.gz
curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/xdrvr.c.gz
curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/check.def

gunzip platon.f.gz
gunzip xdrvr.c.gz

gfortran -o platon platon.f xdrvr.c -I/opt/X11/include -L/opt/X11/lib -lX11
cp ./platon /usr/local/bin

cp ./check.def $HOME/platon/check.def

cd ..
rm -rf ./tmp
