#!/bin/bash
#
# Author: Outhan Chazima 
# Date : 24-May-2022
# Description : The backup script will setup developement environment in linux in 2 phases -
#  1. First Phase: Perform a complete update and upgrade of the system.
#  2. Seconf Phase: Install the following packages:
        # - Ubuntu restricted extras
        # - git
        # - postgres 14
        # - Redis Server (for caching).
        # - NodeJS Environment.
        # - the default java jdk and jre.
        # - Python development tools.
        # - Python virtualenv.
        # - Python pip.
        # - dot.net development tools.
        # - Visual Studio Code.

# Perform complete update and upgrade of the system.
sudo apt update -y && sudo apt dist-upgrade -y && sudo apt upgrade -y

# Installing build essentials
sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
udo apt -y install apt-transport-https ca-certificates gnupg-agent software-properties-common

# install curl and wget
sudo apt install -y wget unzip curl

# install git
sudo apt install -y git

# Installing JDK and JRE
sudo apt install -y default-jre
sudo apt install -y default-jdk

# Installing Python development tools
sudo apt install -y python3-pip

# install postgresql
# Create the file repository configuration:
sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list'

# Import the repository signing key:
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -

# Update the package lists:
sudo apt update

# Install the latest version of PostgreSQL.
# If you want a specific version, use 'postgresql-12' or similar instead of 'postgresql':
sudo apt -y install postgresql

# Generate ssh keys for the user
# ssh-keygen -t rsa -b 4096 -C "

# Installing Redis Server
sudo apt install -y redis-server

# Installing nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.1/install.sh | bash
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm


# Installing docker
sudo apt remove docker docker-engine docker.io containerd runc
# import gpg key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/docker-archive-keyring.gpg
# add docker repository
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
# update package list
sudo apt update
# install docker
sudo apt install -y docker-ce docker-ce-cli containerd.io
# add user to docker group
sudo usermod -aG docker $USER
newgrp docker
 
# Installing docker-compose
curl -s https://api.github.com/repos/docker/compose/releases/latest | grep browser_download_url  | grep docker-compose-linux-x86_64 | cut -d '"' -f 4 | wget -qi -
chmod +x docker-compose-linux-x86_64
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo mv docker-compose-linux-x86_64 /usr/local/bin/docker-compose
sudo usermod -aG docker $USER
newgrp docker

# Installing NodeJS
