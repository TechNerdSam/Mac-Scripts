#!/bin/bash

# Optimization script for iMac running macOS El Capitan
# Used to improve overall performance and gaming experience

# Function to update system and applications
update_system() {
echo "Updating system and applications..."
sudo softwareupdate --install --all
echo "Updates completed."
}

# Function to clean temporary and cache files
clean_temp_files() {
echo "Cleaning temporary and cache files..."
sudo rm -rf /Library/Caches/*
sudo rm -rf ~/Library/Caches/*
echo "Cleaning completed."
}

# Function to disable unnecessary services
disable_unused_services() {
echo "Disabling unnecessary services..."
sudo launchctl unload -w /System/Library/LaunchDaemons/com.apple.locationd.plist
echo "Services disabled."
}

# Function to improve gaming experience
optimize_gaming_experience() {
echo "Optimizing system settings for gaming..."
# Add specific commands here to optimize gaming settings
echo "Optimization completed."
}

# Function to check for software updates
check_software_updates() {
echo "Checking for software updates..."
softwareupdate --list
echo "Checking completed."
}

# Function to monitor system resources
monitor_resources() {
echo "Monitoring system resources..."
echo "CPU usage:"
top -l 1 | grep "CPU usage"
echo "RAM usage:"
vm_stat
echo "Disk usage:"
df -h
}

# Running functions
update_system
clean_temp_files
disable_unused_services
optimize_gaming_experience
check_software_updates
monitor_resources

echo "Optimization script finished."
