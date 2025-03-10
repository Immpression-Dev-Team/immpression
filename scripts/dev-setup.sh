# This tells your local github repo to run husky without the need to
# install husky directly. I have created a docker image that will
# run a containerized version of husky. I have also added the
# automation of docker login and pulling of the husky image I built.

# THESE COMMANDS DO NOT WORK IN WINDOWS POWERSHELL OR CMD...
# THEY NEED TO BE RUN FROM GIT BASH TERMINAL IF ON WINDOWS.
# IF ON LINUX OR MAC, THEY CAN BE RUN FROM TERMINAL.

# To run this script, run this command on all OS' from the immpression folder
# (requires Git to be installed): sh scripts/dev-setup.sh

# Additionally, the 'commit-msg' file in the .husky folder needs
# to be executable in ALL services in order to work:
# RUN: 'chmod +x .husky/commit-msg' in each service

# TODO: RUN THIS FILE AFTER YOU HAVE DOCKER AND GIT SETUP FROM INSIDE THE IMMPRESSION FOLDER

echo "This script requires Docker and Git to be installed."
# shellcheck disable=SC2162
read -p "Have you installed Docker and Git? (y/n): " USER_INPUT

USER_INPUT=$(echo "$USER_INPUT" | tr '[:upper:]' '[:lower:]')

if [ "$USER_INPUT" = "y" ] || [ "$USER_INPUT" = "yes" ]; then
    echo "Proceeding with script..."
elif [ "$USER_INPUT" = "n" ] || [ "$USER_INPUT" = "no" ]; then
    echo "Please install Docker and Git before running this script."
    exit 1
else
    echo "Invalid input. Please enter 'y' or 'n'."
    exit 1
fi

# ROOT FOLDER SETUP:
echo "ROOT SETUP:"

# Set hooksPath
git config core.hooksPath .husky

EXPECTED_OUTPUT=".husky"
ACTUAL_OUTPUT=$(git config --get core.hooksPath)

echo "Output should be $EXPECTED_OUTPUT, output: $ACTUAL_OUTPUT"

if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "Root Script Passed!"
else
    echo "This Script Failed!"
    exit 1
fi
echo ""

# ADMIN FOLDER SETUP:

cd applications/admin/ || exit

echo "ADMIN SETUP:"

# Set hooksPath
git config core.hooksPath .husky

ACTUAL_OUTPUT=$(git config --get core.hooksPath)

echo "Output should be $EXPECTED_OUTPUT, output: $ACTUAL_OUTPUT"

if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "Admin Script Passed!"
else
    echo "Admin Script Failed!"
    exit 1
fi
echo ""

# BACKEND FOLDER SETUP:

cd ../backend || exit

echo "BACKEND SETUP:"

# Set hooksPath
git config core.hooksPath .husky

ACTUAL_OUTPUT=$(git config --get core.hooksPath)

echo "Output should be $EXPECTED_OUTPUT, output: $ACTUAL_OUTPUT"

if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "Backend Script Passed!"
else
    echo "Backend Script Failed!"
    exit 1
fi
echo ""

# MOBILE FOLDER SETUP:

cd ../mobile-app || exit

echo "MOBILE SETUP:"

# Set hooksPath
git config core.hooksPath .husky

ACTUAL_OUTPUT=$(git config --get core.hooksPath)

echo "Output should be $EXPECTED_OUTPUT, output: $ACTUAL_OUTPUT"

if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "Mobile Script Passed!"
else
    echo "Mobile Script Failed!"
    exit 1
fi
echo ""

# WEB FOLDER SETUP:

cd ../web-app || exit

echo "WEB SETUP:"

# Set hooksPath
git config core.hooksPath .husky

ACTUAL_OUTPUT=$(git config --get core.hooksPath)

echo "Output should be $EXPECTED_OUTPUT, output: $ACTUAL_OUTPUT"

if [ "$ACTUAL_OUTPUT" = "$EXPECTED_OUTPUT" ]; then
    echo "Web Script Passed!"
else
    echo "Web Script Failed!"
    exit 1
fi

echo ""

echo "Scripts Completed Successfully!"

docker login

# This image can be found on Docker Hub
docker pull premsanity/husky-commitlint
echo ""

echo "Congrats! if you followed the complete setup in the correct order you should be ready to start developing again!"

