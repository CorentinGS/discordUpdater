#!/usr/bin/env bash

cd ./installer || exit
mkdir -p ~/.local/bin
mkdir ./tmp
echo "Downloading discord PTB..."
wget "https://ptb.discord.com/api/download?platform=linux&format=tar.gz" -O ./tmp/discord-ptb.tar.gz
tar -xvf ./tmp/discord-ptb.tar.gz -C ~/.local/bin
echo "Installing discord PTB..."
sudo ln -s ~/.local/bin/DiscordPTB/discord.png /usr/share/icons/discord-ptb.png
sudo ln -s ~/.local/bin/DiscordPTB/DiscordPTB /usr/bin
mkdir -p ~/.local/share/applications/
cp installer/discord-ptb.desktop ~/.local/share/applications/
sudo ln -s ~/.local/share/applications/discord-ptb.desktop /usr/share/applications/discord-ptb.desktop
echo "Cleaning up..."
rm -rf ./tmp
echo "Done!"
exit 0