# Project Setup Guide

---

## Prerequisites 

- [Docker](https://www.docker.com/)
- [Node](https://nodejs.org/en)
- [npm](https://www.npmjs.com/)
- [Expo Go](https://expo.dev/go)
- [Git](https://git-scm.com/)

---

## Installing Prerequisites

### Docker & Docker Compose

#### Linux

```
# Update System Packages
sudo apt update && sudo apt upgrade -y

# Add Docker's official GPG key
sudo mkdir -m 0755 -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

# Set up the Docker repo
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Install Docker
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

# Install Docker Compose
sudo curl -L "https://github.com/docker/compose/releases/download/$(curl -s https://api.github.com/repos/docker/compose/releases/latest | grep tag_name | cut -d '"' -f 4)/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose

# Give Executable Permissions
sudo chmod +x /usr/local/bin/docker-compose

# Confirm Installations
docker -v
docker-compose --version

# Enable and Start Docker Service
sudo systemctl enable docker
sudo systemctl start docker

# Add User to Docker Group
sudo usermod -aG docker $USER
newgrp docker

# Confirm Docker Compose Standalone Installation
docker compose --version
```

#### Windows & MacOS

- Install Docker Desktop [here](https://www.docker.com/products/docker-desktop/)

Docker Desktop will install both docker, and docker compose during setup.

---

### Node & npm

#### Linux

```
# Update System Packages
sudo apt update && sudo apt upgrade -y

# Install Node.js
curl -fsSL https://deb.nodesource.com/setup_18.x | sudo -E bash -
sudo apt install -y nodejs

# Verify Installation
node --version
npm --version
```

#### Windows & MacOS

- Download Installer: [Prebuilt Installer](https://nodejs.org/en/download/prebuilt-installer)

### Expo Go

- Create Expo Go account [here](https://expo.dev/signup)
- Install Expo Go CLI: `npm install -g expo-cli`
- Sign in to CLI Locally: `expo login`

--- 

### Git

- Install Git, Git Bash, and Git CLI [here](https://git-scm.com/downloads)

## Steps

### Step 1

#### Clone Immpression Repo

- Clone the repo into your desired system file location (e.g. ~/Code/)

```
git clone git@github.com:Immpression-Dev-Team/immpression.git
```

### Step 2

#### Create Untracked GitHub Folder(s)/File(s)

- Create .env file in root folder (immpression)
  - Linux & MacOS: `touch .env`
  - Windows: `echo. > .env`
- Create data folder for persistent local mongoDB storage in root folder (immpression)
  - Linux, macOS, & Windows: `mkdir data`
  - 
### Step 3

#### Populate .env File

- Use .env-example to populate your root .env file, you will need to reach out to someone for sensitive values
- To populate EXPO_TOKEN follow the steps below:
  - Navigate to Expo Go - Access Tokens. Replace this URL with your username: https://expo.dev/accounts/<YOUR_USERNAME>/settings/access-tokens
  - Create a new token and paste its value into EXPO_TOKEN in your .env file

### Step 4

#### Navigate to Applications Folder and Complete README BEFORE Continuing Here

- Complete step [here](https://github.com/Immpression-Dev-Team/immpression/tree/main/applications)

### Step 5

#### Run Docker Network

`docker compose up -d`

Please note that the initial building of containers will take a while. Time will depend on the power of your machine and network speeds.

I recommend learning common docker commands so you are not getting stuck constantly. You will get familiar with them over time, but to get you started are some common commands you will use often:

```
docker compose up -d
docker compose down -v
docker logs -f <container_name>
```

- -d stands for "detached", this means the docker network will run the containers in the background, keeping the current terminal open to be used.
- -v stands for "volumes", in this case it means that it will delete the cached volumes in the docker containers. There is a data folder that folder locally that holds data for the backend if you are using the app not using the production database. Deleting the data folder locally and using -v when bringing the container down will reset the database.
- -f stands "follow", running `docker logs <container_name>` without -f will only show the logs that already happened, -f will keep the logs open and show logs as they happen until closed.

There are many more commands and flags, but these are the ones you will need to use the most.

## Run the script

There is only one more thing to do, and it is to run the script located in the scripts folder of the root folder.

- There are instructions in the script to run it, and I recommend reading the script to try and understand it, however, To run the script you can run `sh scripts/dev-setup.sh` directly from the terminal if you are on Linux or macOS. If you are on Windows you can run that command only from within the Git Bash.