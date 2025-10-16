#!/usr/bin/env bash

# Ask for user's name
read -p "Enter your name: " username

#  main directory
main_dir="submission_reminder_${username}"

# Creating the main and subdirectories
mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/config"

echo "structure created for $main_dir"

# Converting  all shell scripts and config files to Unix format just in case
find "$main_dir" -type f \( -name "*.sh" -o -name "*.env" \) -exec dos2unix {} \;


# getting files from Downloads 
cp /mnt/c/Users/HP/Downloads/submissions.txt "$main_dir/assets/" 2>/dev/null || echo " submissions.txt not found in Downloads"
cp /mnt/c/Users/HP/Downloads/reminder.sh "$main_dir/app/" 2>/dev/null || echo "reminder.sh not found in Downloads"
cp /mnt/c/Users/HP/Downloads/functions.sh "$main_dir/modules/" 2>/dev/null || echo " functions.sh not found in Downloads"
cp /mnt/c/Users/HP/Downloads/config.env "$main_dir/config/" 2>/dev/null || echo "config.env not found in Downloads"

# Add 5 extra student records to submissions.txt
cat <<EOL >> "$main_dir/assets/submissions.txt"
Derrick ,Shell Basics, not submitted
Alvin, Git, submitted
Kizito, Shell Basics, not submitted
Laura, Shell Navigation, submitted
Kuma, Git, not submitted
EOL

# make startup.sh inside the environment
cat <<'EOL' > "$main_dir/startup.sh"
#!/usr/bin/env bash

# Automatically detect directory name
CURRENT_DIR=$(dirname "$0")
cd "$CURRENT_DIR"

echo "Starting the reminder app..."
bash app/reminder.sh
EOL

# Converting all shell scripts and env file to Unix format because they were in windows
    
    dos2unix "$main_dir/modules/functions.sh" \
             "$main_dir/app/reminder.sh" \
             "$main_dir/config/config.env" \
             "$main_dir/startup.sh" 2>/dev/null


#give execution oermission to all shell scripts 
chmod +x "$main_dir/app/"*.sh 2>/dev/null
chmod +x "$main_dir/modules/"*.sh 2>/dev/null
chmod +x "$main_dir/startup.sh"

# copy copilot_shell_script.sh 
if [ -f "./copilot_shell_script.sh" ]; then
    cp ./copilot_shell_script.sh "$main_dir/"
    chmod +x "$main_dir/copilot_shell_script.sh"
fi

echo "successfully created the environment in $main_dir"
echo "you can run the app with:"
echo "  bash $main_dir/startup.sh"
echo "Or update the assignment with:"
echo "  bash $main_dir/copilot_shell_script.sh"


