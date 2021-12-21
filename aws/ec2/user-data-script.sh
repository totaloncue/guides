#!/bin/bash

# Ubuntu Setup User Data Script

# Update and Upgrade
apt-get update && apt-get upgrade -y
apt-get install build-essential -y

# Install AWS CLI
apt-get -y install awscli

# Set aws region
aws configure set region ap-south-1

# Add Swap
fallocate -l 1G /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
swapon --show
cp /etc/fstab /etc/fstab.bak
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
sysctl vm.swappiness=10

# Install Docker
apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository \
    "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) \
    stable"
apt-get update
apt-get install -y docker-ce docker-ce-cli containerd.io
# sudo systemctl status docker
usermod -aG docker ubuntu

# Install neovim
apt-get install -y neovim
apt-get install -y python3-neovim
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
apt-get install -y fzf

# Load custom .bashrc
aws s3 cp s3://personal-dev-configs/bash/bash.rc /home/ubuntu/.bashrc
chown ubuntu:ubuntu .bashrc
chmod 644 .bashrc
source /home/ubuntu/.bashrc

# Setup cloudwatch agent
wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb
dpkg -i -E ./amazon-cloudwatch-agent.deb

# Load base cloudwatch logs config
aws s3 cp s3://personal-dev-configs/cloudwatch-agent/config.json /opt/aws/amazon-cloudwatch-agent/bin/config.json

# Start cloudwatch logs config
/opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s

# Activate AWS SSM 
snap start amazon-ssm-agent



