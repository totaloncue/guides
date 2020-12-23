# Fresh Setup of Ubuntu 20 ARM-64 Server

## Basic Setup for All Machines

1. Edit .bashrc to do the following:

   1. Enable colour terminal (force_color_prompt=yes)

1. Update and upgrade packages

   ```shell
   sudo apt update
   apt list --upgradable
   sudo apt upgrade
   ```

1. Set up for development

   ```shell
   sudo apt install build-essential
   ```

1. Add some swap

   1. [Reference](https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-20-04)

   ```shell
   sudo fallocate -l 1G /swapfile
   ls -lh /swapfile
   sudo chmod 600 /swapfile
   sudo mkswap /swapfile
   sudo swapon /swapfile
   sudo swapon --show
   sudo cp /etc/fstab /etc/fstab.bak
   echo '/swapfile none swap sw 0 0' | sudo tee -a /etc/fstab
   sudo sysctl vm.swappiness=10
   ```

1. Install docker

   1. [Docker reference](https://docs.docker.com/engine/install/ubuntu/)
   1. [DigitalOceanGuid](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

   ```shell
   sudo apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository \
      "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
   sudo apt update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
   sudo systemctl status docker
   sudo usermod -aG docker ubuntu
   ```

1. Install AWS CLI and attach IAM role

   ```shell
   sudo apt -y install awscli
   ```

   1. Most required settings for the CLI will be pulled from the IAM role. To set region:

   ```shell
   aws configure set region ap-south-1
   ```

1. Activate AWS SSM to allow remote triggers of commands on the instance

   ```shell
   sudo snap start amazon-ssm-agent
   ```

1. Install neovim and vimplug and fzf

   ```shell
   sudo apt install -y neovim
   sudo apt install -y python3-neovim
   sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   sudo apt install -y fzf
   ```

   1. Create ~/.config/nvim/init.vim

   ```shell
   mkdir ~/.config/nvim/colors -p
   ```

   1. Run :PlugInstall within neovim
   1. Setup alias for vi to point to nvim
   1. Add monokai.vim color file

## Production and Stage Servers

## Development Machine

1. Install nodejs

   1. [DigitalOcean Reference](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)

   ```shell
   curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
   <!-- curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh -->
   sudo bash nodesource_setup.sh
   sudo apt install -y nodejs
   sudo apt-get install gcc g++ make
   ```

1. Install yarn

```shell
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update && sudo apt install yarn
```

1. Install python

   1. [DigitalOcean Reference](https://www.digitalocean.com/community/tutorials/how-to-install-python-3-and-set-up-a-programming-environment-on-an-ubuntu-20-04-server)

   ```shell
   sudo apt install -y python3-pip
   sudo apt install -y build-essential libssl-dev libffi-dev python3-dev
   ```

1. Run HAProxy on Docker

   1. [Guide to set up and run HAProxy using Docker](https://github.com/totaloncue/guides/blob/master/infra/haproxy-on-docker.md)

1. Set up SSL Certs using LetsEncrypt

   1. [Guide to setting up SSL certs with LetsEncrypt](https://github.com/totaloncue/guides/blob/master/aws/ec2/ssl-letsencrypt-guide.md)

1. Github Actions Runner as a service

1. Startup Script
   1. restart docker with all running containers
   1. restart github actions runner service
