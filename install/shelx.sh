#!/bin/bash

set -e

function wrap() {
  cols=$(tput cols)
  if [[ $cols -gt 80 ]]; then
    cols=80;
  fi
  echo $1 | fold -s -w $cols
}


REG_PATH="http://shelx.uni-goettingen.de/register.php"
DL_PATH="http://shelx.uni-goettingen.de/bin/mac/"
DL_FILE_LIST=(
  anode.bz2
  ciftab.bz2
  pdb2ins
  pdb2insGUI
  shelxc.bz2
  shelxd.bz2
  shelxe.bz2
  shelxl.bz2
  shelxs.bz2
  shelxt.bz2
  shredcif.bz2
)

wrap "This script will attempt to download and install SHELX."
echo
wrap "Make sure you've registered at:"
echo "    $REG_PATH"
echo
wrap "Then enter the username and password:"
echo -n "Username: "
read username
echo -n "Password: "
read -s password
echo
echo

reg_check=$(curl -s -o /dev/null -w "%{http_code}" -u $username:$password -I $DL_PATH)
if [[ $reg_check -ne "200" ]]; then
  wrap "Couldn't access $DL_PATH. Username+password might be wrong, or the site might be down."
  echo
  wrap "Sorry!"
  exit 1
fi

mkdir -p shelx_tmp

pushd shelx_tmp

# wget would make this easier but I'm trying to avoid installing
#    extra software
for f in ${DL_FILE_LIST[@]}; do
  curl --remote-name -u shelx:I43212 $DL_PATH$f

  # just some mild throttling because this server
  #    seems to get cranky if things happen too fast
  sleep $(echo "scale=8; $RANDOM/32768" | bc)
done

# extract everything that's compressed
bunzip2 ./*.bz2

# make it executable
chmod ugo+x ./*

# put it on the path so it can be run
mv ./* /usr/local/bin

popd

rm -rf shelx_tmp
