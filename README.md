# Project Setup Guide  

---

## Prerequisites 

- [Docker](https://www.docker.com/)
- [Node](https://nodejs.org/en)
- [npm](https://www.npmjs.com/)
- [Expo Go](https://expo.dev/go)

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

#### Expo Go

- Create Expo Go account [here](https://expo.dev/signup)
- Install Expo Go CLI: `npm install -g expo-cli`
- Sign Into CLI Locally: `expo login`

--- 

## Steps

### Step 1

#### Clone Immpression Repo (If you haven't already)

- Clone the repo into your desired system file location (e.g. ~/Code/)

```
git clone git@github.com:Immpression-Dev-Team/immpression.git
```

### Step 2

#### Create Untracked GitHub Folder(s)/File(s)

- Create .env file in root folder (immpression)
  - Linux & MacOS: `touch .env`
  - Windows: `echo. > filename.txt`
- Create data folder for persistent local mongoDB storage in root folder (immpression)
  - Linux, MacOS, & Windows: `mkdir data`

### Step 3

#### Populate .env File

- Use .env-example to populate your .env file, you will need to reach out to someone for sensitive values
- To populate EXPO_TOKEN follow the steps below:
  - Navigate to Expo Go - Access Tokens. Replace this URL with your username: https://expo.dev/accounts/<YOUR_USERNAME>/settings/access-tokens
  - Create a new token and paste its value into EXPO_TOKEN in your .env file

### Step 4

#### Navigate to Applications Folder and Complete README BEFORE Continuing Here

- Complete step [here](https://github.com/Immpression-Dev-Team/immpression/tree/main/applications)

### Step 5

#### Run Docker Network

`docker compose up -d`

Please note that the inital building of containers will a while. For me it took close to 10mins, time will depend on the power of your machine and network speeds.
