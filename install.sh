#!/usr/bin/env bash

echo 'Cleaning up any old versions...'
rm -rf /usr/local/bin/.auxilium

echo 'Installing python dependencies...'
#pip3 install -r requirements.txt
python3 -m pip install -r requirements.txt
echo 'Installing latest version...'
cp -r {aux,auxilium.yml,.auxilium} /usr/local/bin/
