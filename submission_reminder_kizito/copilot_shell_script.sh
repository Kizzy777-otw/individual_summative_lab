#!/usr/bin/env bash

# get new assignment name
read -p "Update assignment to: " new_assignment

# find the current submission_reminder_<name> directory
current_dir=$(dirname "$0")
config_file=$(find "$current_dir" -type f -path "*/config/config.env" | head -n 1)



# Update the assignment name in config.env
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$config_file"

# Confirm update
echo "The assignment is  set to '$new_assignment' in $config_file."

