#!/bin/bash

# This is a script that can be used to easily install platon on macOS. If it doesn't work for
#    you for some reason, leave a comment explaning what went wrong.
#
# You can run this automatically by opening the terminal and pasting the following line:
#     /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/sjml/chemistry/master/install/platon.sh)"
#
# If you don't want to pipe the internet right into your terminal, you can download this file,
#    then in your terminal run "chmod +x <path to this file>" and thereafter just run it.
#
# Note that it will ask for your password, so stick around. It may look like it's frozen at a
#    few points, but that's just because installing Xquartz and compiling stuff takes a bit of
#    time. After it's done, open up an Xquartz terminal and run this command to test it:
#
#     platon ~/Desktop/platon/sucrose.spf


/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

brew cask install xquartz
brew install gcc

mkdir -p $HOME/Desktop/platon
cd $HOME/Desktop/platon

curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/platon.f.gz
curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/xdrvr.c.gz
curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/check.def
curl --remote-name https://www.platonsoft.nl/xraysoft/unix/platon/sucrose.spf

gunzip platon.f.gz
gunzip xdrvr.c.gz

gfortran -o platon platon.f xdrvr.c -I/opt/X11/include -L/opt/X11/lib -lX11

cp ./platon /usr/local/bin

mkdir -p $HOME/platon
cp ./check.def $HOME/platon/check.def

export CHECKDEF=$HOME/platon/check.def
echo "export CHECKDEF=$HOME/platon/check.def" >> $HOME/.bashrc
echo "export CHECKDEF=$HOME/platon/check.def" >> $HOME/.zshrc
