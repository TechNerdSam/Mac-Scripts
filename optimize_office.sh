#!/bin/bash

# Script to maximize the efficiency of Microsoft Office and OneNote on macOS El Capitan

# Function to start Microsoft Office applications
launch_office_apps() {
echo "Starting Microsoft Office applications..."
open -a "Microsoft Word"
open -a "Microsoft Excel"
open -a "Microsoft PowerPoint"
open -a "Microsoft Outlook"
open -a "Microsoft OneNote"
echo "All applications have been launched successfully."
}

# Function to update Microsoft Office and OneNote
update_office_apps() {
echo "Checking for available updates for Microsoft Office and OneNote..."
# Launch the Microsoft automatic update tool
/Applications/Microsoft\ AutoUpdate.app/Contents/MacOS/Microsoft\ AutoUpdate
echo "The update process is now complete."
}

# Function to run diagnostics and fix common problems
check_office_diagnostics() {
echo "Running diagnostics to detect and fix problems in Microsoft Office..."
# Checking permissions on preference files
sudo chmod -R 755 ~/Library/Group\ Containers/UBF8T346G9.Office
echo "Diagnostics ran successfully."
}

# Function to optimize system settings to improve performance
optimize_performance() {
echo "Optimizing system settings to improve the responsiveness of Office applications..."
# Disabling visual effects for increased performance
defaults write com.microsoft.Word NSVisualEffectBlendingMode -string "None"
defaults write com.microsoft.Excel NSVisualEffectBlendingMode -string "None"
defaults write com.microsoft.PowerPoint NSVisualEffectBlendingMode -string "None"
defaults write com.microsoft.Outlook NSVisualEffectBlendingMode -string "None"
defaults write com.microsoft.OneNote NSVisualEffectBlendingMode -string "None"
echo "Performance optimization is now complete."
}

# Main function that orchestrates the execution of other functions
main() {
launch_office_apps
update_office_apps
check_office_diagnostics
optimize_performance
echo "All optimization processes have been completed successfully."
}

# Execution of the main function
main

# End of the script
