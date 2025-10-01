#!/usr/bin/bash

source ../Bash/utils.sh

repos=(
    "https://github.com/user1/test1.git"
    "https://github.com/user2/test2.git"
)

# Save the current directory
current_dir=$(pwd)
rc=0

# Optional location to clone into
if [ -z "$1" ]; then
    echo "No location provided. Cloning into current directory."
else
    location_to_clone="$1"
    cd "$location_to_clone" || error "Failed to change directory to $location_to_clone", "$current_dir"
    echo "Cloning into $location_to_clone"
fi

# Loop through each repo URL
for repo in "${repos[@]}"
do
    # Extract repo name from URL
    repo_name=$(basename "$repo" .git)
    
    # Remove existing folder if it exists
    if [ -d "$repo_name" ]; then
        echo "Removing existing $repo_name folder"

        rm -rf "$repo_name"
        rc=$?
        if [ 0 -eq "$rc" ]; then
            successful "Successfully removed $repo_name"
        else
            error "Failed to remove $repo_name" "$current_dir"
        fi
    fi

    # Clone the repository
    echo "Cloning $repo"

    git clone "$repo"
    rc=$?
    if [ 0 -eq "$rc" ]; then
        successful "Successfully cloned $repo"
    else
        error "Failed to clone $repo" "$current_dir"
    fi
done

# Return to the original directory
cd "$current_dir" || error "Failed to return to $current_dir"
