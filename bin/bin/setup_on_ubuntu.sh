#!/bin/bash

echo 'This installation requires sudo priv'

echo 'The following apt packages { git stow ecryptfs-utils vim neofetch vrms tree curl thunderbird apt-transport-https } will be installed'

while true; do
	read -p 'Do you wish do continue? y/n ' yn
	case $yn in
		[Yy]* ) echo 'installing'; apt install git stow ecryptfs-utils vim neofetch vrms tree curl thunderbird apt-transport-https; break;;
		[Nn]* ) echo 'aborting'; exit;;
		* ) echo 'Please enter y or no';;
	esac
done

echo 'The follow snap packages will be installed { ncspot slack code gitkraken }'

while true; do
	read -p 'Do you wish do continue? y/n ' yn
	case $yn in
		[Yy]* ) echo 'installing'; snap install ncspot; snap install code --classic; snap install slack --classic; snap install gitkraken; break;;
		[Nn]* ) echo 'aborting'; exit;;
		* ) echo 'Please enter y or no';;
	esac
done
