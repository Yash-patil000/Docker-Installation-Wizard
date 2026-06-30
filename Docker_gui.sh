#!/bin/bash

# Docker Installation Wizard

# Welcome Screen
zenity --info \
--title="Docker Wizard" \
--text="Welcome to Docker Installation Wizard"

# Check if Docker is already installed
if command -v docker &> /dev/null
then
    zenity --info \
    --title="Docker Status" \
    --text="Docker is already installed."
    exit 0
fi

# Ask for confirmation
zenity --question \
--title="Confirmation" \
--text="Docker is not installed. Do you want to install it?"

if [ $? -ne 0 ]; then
    zenity --warning \
    --title="Cancelled" \
    --text="Installation cancelled by user."
    exit 1
fi

# Detect Operating System
OS=$(source /etc/os-release && echo "$ID")

# Ubuntu / Debian
if [[ "$OS" == "ubuntu" || "$OS" == "debian" ]]; then
(
echo "10"
sudo apt update || exit 1
echo "40"
sudo apt install -y docker.io || exit 1
echo "100"
) | zenity --progress \
--title="Installing Docker" \
--percentage=0 \
--auto-close

# RHEL / CentOS
elif [[ "$OS" == "rhel" || "$OS" == "centos" ]]; then
(
echo "10"
sudo dnf install -y dnf-plugins-core || exit 1
echo "40"
sudo dnf config-manager --add-repo https://download.docker.com/linux/rhel/docker-ce.repo || exit 1
echo "70"
sudo dnf install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin || exit 1
echo "100"
) | zenity --progress \
--title="Installing Docker" \
--percentage=0 \
--auto-close

else

    zenity --error \
    --title="Unsupported OS" \
    --text="This Linux distribution is not supported."

    exit 1

fi

# Verify Installation

if ! command -v docker &> /dev/null
then
    zenity --error \
    --title="Installation Failed" \
    --text="Docker installation failed.

Possible reasons:
• No Internet connection
• DNS issue
• Repository unavailable
• Package installation failed"

    exit 1
fi

# Enable Docker Service
sudo systemctl enable docker

if [ $? -ne 0 ]; then

    zenity --error \
    --title="Service Error" \
    --text="Unable to enable Docker service."

    exit 1

fi

sudo systemctl start docker

if [ $? -ne 0 ]; then

    zenity --error \
    --title="Service Error" \
    --text="Unable to start Docker service."

    exit 1

fi

# Success

VERSION=$(docker --version)

zenity --info \
--title="Installation Complete" \
--text="Docker has been installed successfully!

$VERSION"

exit 0
