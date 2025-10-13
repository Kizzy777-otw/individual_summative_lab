#!/usr/bin/env bash
read -p "Enter the assignment name: " new_assignment
#replacing old assignment name with the new one
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" ./config/config.env
#confirming changes
echo "The assignment is now '$new_assignment' in config/config.env."

