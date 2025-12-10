#!/usr/bin/bash

source ../Bash/utils.sh

# Save the current directory
current_dir=$(pwd)

sudo apt update -y --allow-downgrades --allow-remove-essential --allow-change-held-packages
rc=$?
if [ 0 -ne "$rc" ]; then
    error "Failed to update package lists." "$current_dir"
fi

sudo apt upgrade -y --allow-downgrades --allow-remove-essential --allow-change-held-packages
rc=$?
if [ 0 -ne "$rc" ]; then
    error "Failed to upgrade packages." "$current_dir"
fi

sudo apt autoremove -y
rc=$?
if [ 0 -ne "$rc" ]; then
    error "Failed to autoremove unnecessary packages." "$current_dir"
fi

# Return to the original directory
cd "$current_dir" || error "Failed to return to $current_dir"
