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