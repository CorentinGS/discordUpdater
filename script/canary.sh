#!/usr/bin/env bash

cd ./installer || exit
mkdir -p ~/.local/bin
mkdir ./tmp
echo "Downloading canary..."
wget "https://discordapp.com/api/download/canary?platform=linux&format=tar.gz" -O ./tmp/discord-canary.tar.gz
tar -xvf ./tmp/discord-canary.tar.gz -C ~/.local/bin
echo "Installing canary..."
sudo ln -s ~/.local/bin/DiscordCanary/discord.png /usr/share/icons/discord-canary.png
sudo ln -s ~/.local/bin/DiscordCanary/DiscordCanary /usr/bin
mkdir -p ~/.local/share/applications/
cp installer/discord-canary.desktop ~/.local/share/applications/
sudo ln -s ~/.local/share/applications/discord-canary.desktop /usr/share/applications/discord-canary.desktop
echo "Cleaning up..."
rm -rf ./tmp
echo "Done!"
exit 0