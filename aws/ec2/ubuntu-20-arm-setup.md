# Fresh Setup of Ubuntu 20 ARM-64 Server

## Basic Setup for All Machines

1. Update and upgrade packages

   ```shell
   sudo apt-get update -y
   sudo apt-get upgrade -y
   ```

1. Install essential build tools

   ```shell
   sudo apt-get install build-essential -y
   ```

1. Install AWS CLI

   ```shell
   sudo apt -y install awscli
   ```

   1. Most required settings for the CLI will be pulled from the IAM role. To set region:

   ```shell
   aws configure set region ap-south-1
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

1. Install neovim and vimplug and fzf

   ```shell
   sudo snap install nvim --classic
   # sudo apt install -y neovim
   # sudo apt install -y python3-neovim
   # sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
   #    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
   curl -fLo /home/ubuntu/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
   sudo chown -R ubuntu:ubuntu /home/ubuntu/.local
   sudo chmod -R 775 /home/ubuntu/.local
   sudo apt-get install -y fzf
   ```

   1. Add preferred configuration

   ```shell
   mkdir /home/ubuntu/.config/nvim/colors -p
   aws s3 cp s3://personal-dev-configs/nvim/init.vim /home/ubuntu/.config/nvim/init.vim
   aws s3 cp s3://personal-dev-configs/nvim/monokai.vim /home/ubuntu/.config/nvim/colors/monokai.vim
   sudo chown -R ubuntu:ubuntu /home/ubuntu/.config
   sudo chmod -R 755 /home/ubuntu/.config
   runuser -l ubuntu -c 'nvim --headless +PlugInstall +qa'
   ```

   1. Edit .bashrc

   ```shell
   echo '' | tee -a /home/ubuntu/.bashrc
   echo '# Replace vim with neovim' | tee -a /home/ubuntu/.bashrc
   echo 'alias vi="nvim"' | tee -a /home/ubuntu/.bashrc
   echo 'alias vim="nvim"' | tee -a /home/ubuntu/.bashrc
   source /home/ubuntu/.bashrc
   ```

1. Setup Cloudwatch Agent to collect logs:

   1. Download and install agent on Ubuntu 20 ARM-64

   ```shell
   wget https://s3.amazonaws.com/amazoncloudwatch-agent/ubuntu/arm64/latest/amazon-cloudwatch-agent.deb
   ```

   Change directory to location of file and

   ```shell
   sudo dpkg -i -E ./amazon-cloudwatch-agent.deb
   ```

   1. Configure the agent

      1. Configuration file is a JSON file that specifies the metrics and logs to be collected, including custom metrics
      1. Can be created using the configuration wizard or by writing from scratch
      1. Agent must be restarted with each change to the configuration file

      ```shell
      sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-config-wizard
      ```

      1. Configuration file is generated by the wizard and stored at /opt/aws/amazon-cloudwatch-agent/bin/

   1. Install collectd if needed

      ```shell
      sudo yum install collectd
      ```

   1. Run the agent

      ```shell
      sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:<configuration-file-path> -s
      ```

      e.g. on Ubuntu

      ```shell
      sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -a fetch-config -m ec2 -c file:/opt/aws/amazon-cloudwatch-agent/bin/config.json -s
      ```

   1. Stop the agent

      ```shell
      sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a stop
      ```

   1. Check that the agent is running

      ```shell
      sudo /opt/aws/amazon-cloudwatch-agent/bin/amazon-cloudwatch-agent-ctl -m ec2 -a status
      ```

## Additional Tools

1. Install docker

   1. [Docker reference](https://docs.docker.com/engine/install/ubuntu/)
   1. [DigitalOceanGuid](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04)

   ```shell
   sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common gnupg-agent
   curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
   sudo add-apt-repository \
      "deb [arch=arm64] https://download.docker.com/linux/ubuntu \
      $(lsb_release -cs) \
      stable"
   sudo apt-get update
   sudo apt-get install docker-ce docker-ce-cli containerd.io
   sudo systemctl status docker
   sudo usermod -aG docker ubuntu
   ```

1. Install docker compose (does NOT work on ARM64)

   1. [Reference](https://docs.docker.com/compose/install/)
   1. [DigitalOceanGuide](https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-compose-on-ubuntu-20-04)

   ```shell
   sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
   sudo chmod +x /usr/local/bin/docker-compose
   ```

   For ARM64 architectures:

   ```shell
   sudo pip install docker-compose
   ```

1. Activate AWS SSM to allow remote triggers of commands on the instance

   ```shell
   sudo snap start amazon-ssm-agent
   ```

1. Watch files and directories using inotify

   ```shell
   sudo apt install inotify-tools
   ```

## Development Machine Additions

1. Install nodejs

   1. [DigitalOcean Reference](https://www.digitalocean.com/community/tutorials/how-to-install-node-js-on-ubuntu-20-04)

   ```shell
   curl -sL https://deb.nodesource.com/setup_14.x -o nodesource_setup.sh
   <!-- curl -sL https://deb.nodesource.com/setup_12.x -o nodesource_setup.sh -->
   sudo bash nodesource_setup.sh
   sudo apt install -y nodejs
   sudo apt-get install gcc g++ make
   ```

   1. Snap method

   ```shell
   sudo snap install node --classic --channel=14
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

1. Set up Github Actions Runner as a service

1. Startup Script
   1. restart docker with all running containers (this happens automatically anyway?)
   1. restart github actions runner service

## Adding volumes to machines

Make a filesystem on an attached volume

```shell
sudo mkfs -t xfs /dev/nvme1n1
```

Create mount point

```shell
sudo mkdir /data
```

Mount volume

```shell
sudo mount /dev/nvme1n1 /data
```

Mount volumes on reboot by editing /etc/fstab file

```shell
UUID=aebf131c-6957-451e-8d34-ec978d9581ae  /data  xfs  defaults,nofail  0  2
```

## Additional tools
