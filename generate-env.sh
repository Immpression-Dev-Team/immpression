#!/bin/bash

# Detect Host IP
if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    HOST_IP=$(hostname -I | awk '{print $1}')
elif [[ "$OSTYPE" == "darwin"* ]]; then
    HOST_IP=$(ipconfig getifaddr en0)
elif [[ "$OSTYPE" == "msys"* ]] || [[ "$OSTYPE" == "cygwin"* ]]; then
    HOST_IP=$(ipconfig | grep -A 2 "Wireless LAN adapter Wi-Fi" | grep "IPv4 Address" | awk '{print $NF}')
else
    echo "Unsupported OS. Please set HOST_IP manually in .env"
    exit 1
fi

# Check if .env file exists
if [ ! -f .env ]; then
    echo ".env file does not exist. Creating one."
    echo "HOST_IP=$HOST_IP" > .env
else
    # Check if HOST_IP already exists in .env
    if grep -q "^HOST_IP=" .env; then
        # Update existing HOST_IP value
        sed -i.bak "s/^HOST_IP=.*/HOST_IP=$HOST_IP/" .env
        echo "Updated HOST_IP in .env to $HOST_IP"
    else
        # Append HOST_IP to the file
        echo "HOST_IP=$HOST_IP" >> .env
        echo "Added HOST_IP=$HOST_IP to .env"
    fi
fi
