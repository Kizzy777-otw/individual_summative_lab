#!/usr/bin/env bash

# Automatically detect directory name
CURRENT_DIR=$(dirname "$0")
cd "$CURRENT_DIR"

echo "Starting the reminder app..."
bash app/reminder.sh
