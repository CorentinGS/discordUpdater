#!/usr/bin/env bash

mkdir -p ~/.local/bin
mkdir ./tmp
cd ./tmp || exit
echo "Downloading discord..."
wget "https://discord.com/api/download?platform=linux&format=tar.gz" -O ./tmp/discord.tar.gz
tar -xvf ./tmp/discord.tar.gz -C ~/.local/bin
echo "Installing discord..."
sudo rm /usr/bin/Discord|| true # Remove old symlink
sudo ln -s ~/.local/bin/Discord/discord.png /usr/share/icons/discord.png
sudo ln -s ~/.local/bin/Discord/Discord /usr/bin
mkdir -p ~/.local/share/applications/
wget https://raw.githubusercontent.com/CorentinGS/discordUpdater/main/assets/discord.desktop -O ~/.local/share/applications/discord.desktop
sudo rm /usr/share/applications/discord.desktop || true # Remove old symlink
sudo ln -s ~/.local/share/applications/discord.desktop /usr/share/applications/discord.desktop
echo "Cleaning up..."
cd ../ && rm -rf ./tmp
echo "Done!"
exit 0