#!/usr/bin/env bash

mkdir -p ~/.local/bin
mkdir ./tmp
cd ./tmp || exit
echo "Downloading discord PTB..."
wget "https://discord.com/api/download/ptb?platform=linux&format=tar.gz" -O discord-ptb.tar.gz
tar -xvf discord-ptb.tar.gz -C ~/.local/bin
echo "Installing discord PTB..."
sudo rm /usr/bin/DiscordPTB || true # Remove old symlink
sudo ln -s ~/.local/bin/DiscordPTB/discord.png /usr/share/icons/discord-ptb.png
sudo ln -s ~/.local/bin/DiscordPTB/DiscordPTB /usr/bin
mkdir -p ~/.local/share/applications/
wget https://raw.githubusercontent.com/CorentinGS/discordUpdater/main/assets/discord-ptb.desktop -O ~/.local/share/applications/discord-ptb.desktop
sudo rm /usr/share/applications/discord-ptb.desktop || true # Remove old symlink
sudo ln -s ~/.local/share/applications/discord-ptb.desktop /usr/share/applications/discord-ptb.desktop
echo "Cleaning up..."
cd ../ && rm -rf ./tmp
echo "Done!"
exit 0