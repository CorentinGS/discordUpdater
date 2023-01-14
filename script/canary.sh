#!/usr/bin/env bash

mkdir -p ~/.local/bin
mkdir ./tmp
cd ./tmp || exit
echo "Downloading canary..."
wget "https://discordapp.com/api/download/canary?platform=linux&format=tar.gz" -O ./tmp/discord-canary.tar.gz
tar -xvf ./tmp/discord-canary.tar.gz -C ~/.local/bin
echo "Installing canary..."
sudo rm /usr/bin/DiscordCanary || true # Remove old symlink
sudo ln -s ~/.local/bin/DiscordCanary/discord.png /usr/share/icons/discord-canary.png
sudo ln -s ~/.local/bin/DiscordCanary/DiscordCanary /usr/bin
mkdir -p ~/.local/share/applications/
wget https://raw.githubusercontent.com/CorentinGS/discordUpdater/main/assets/discord-canary.desktop -O ~/.local/share/applications/discord-canary.desktop
sudo rm /usr/share/applications/discord-canary.desktop || true # Remove old symlink
sudo ln -s ~/.local/share/applications/discord-canary.desktop /usr/share/applications/discord-canary.desktop
echo "Cleaning up..."
cd ../ && rm -rf ./tmp
echo "Done!"
exit 0