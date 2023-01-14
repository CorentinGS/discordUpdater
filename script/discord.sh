#!/usr/bin/env bash

cd ./installer || exit
mkdir -p ~/.local/bin
mkdir ./tmp
echo "Downloading discord..."
wget "https://discord.com/api/download?platform=linux&format=tar.gz" -O ./tmp/discord.tar.gz
tar -xvf ./tmp/discord.tar.gz -C ~/.local/bin
echo "Installing discord..."
sudo ln -s ~/.local/bin/Discord/discord.png /usr/share/icons/discord.png
sudo ln -s ~/.local/bin/Discord/Discord /usr/bin
mkdir -p ~/.local/share/applications/
cp installer/discord.desktop ~/.local/share/applications/
sudo ln -s ~/.local/share/applications/discord.desktop /usr/share/applications/discord.desktop
echo "Cleaning up..."
rm -rf ./tmp
echo "Done!"
exit 0