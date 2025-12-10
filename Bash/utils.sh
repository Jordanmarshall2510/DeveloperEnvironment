#!/usr/bin/bash

successful() {
    if [ -n "$1" ]; then
        local message="$1"
        echo "$message"
    fi
}

error() {
    if [ -n "$1" ]; then
        local message="$1"
        echo "$message"
    fi

    if [ -n "$2" ]; then
        local current_dir="$2"
        cd "$current_dir" || echo "Failed to return to $current_dir"
    fi

    exit 1
}
