#!/usr/bin/env bash

# Prompt user
echo "Please Enter your sudo password!"

# Delete old version
if [ -f "/usr/bin/genpwd" ]; then
    sudo rm "/usr/bin/genpwd"
fi
if [ -f "/usr/bin/genpwd.sh" ]; then
    sudo rm "/usr/bin/genpwd.sh"
fi

# Download Latest Version
sudo wget -O "/usr/bin/genpwd" "https://raw.githubusercontent.com/CortezJEL/genpwd/main/genpwd.sh"

# Make latest version rnable
sudo chmod +x /usr/bin/genpwd

# Define the directory to check
DIR="/usr/bin/genpwd"

# Function to add directory to PATH in a given file
add_to_file() {
    local file=$1
    echo "Adding $DIR to $file"
    echo "export PATH=\"$DIR:\$PATH\"" >> $file
}

# Check if DIR is in the PATH
if [[ ":$PATH:" != *":$DIR:"* ]]; then
    echo "$DIR is not in PATH. Adding to .zshrc and .bashrc..."

    # Check and modify .zshrc
    [ -f "$HOME/.zshrc" ] && add_to_file "$HOME/.zshrc"

    # Check and modify .bashrc
    [ -f "$HOME/.bashrc" ] && add_to_file "$HOME/.bashrc"
fi

echo "Installation complete!"
