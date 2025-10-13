#!/usr/bin/env bash
#creating the submission reminder app automatically
 echo "Go on enter your name here:"
read user_name

#main directory
main_dir="submission_reminder_${user_name}"
mkdir -p "$main_dir"

#subdirectories

mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/config"

# adding the downloaded files to their destination
cp /mnt/c/Users/HP/Downloads/submissions.txt "$main_dir/assets/"
cp /mnt/c/Users/HP/Downloads/reminder.sh "$main_dir/app/"
cp /mnt/c/Users/HP/Downloads/functions.sh "$main_dir/modules/"
cp /mnt/c/Users/HP/Downloads/config.env "$main_dir/config/"


# Create startup.sh to run reminder.sh
cat <<'EOL' > "$main_dir/startup.sh"
#!/usr/bin/env bash
bash app/reminder.sh
EOL

# Make all shell scripts executable
chmod +x "$main_dir/app/"*.sh
chmod +x "$main_dir/modules/"*.sh
chmod +x "$main_dir/startup.sh"

echo "Environment created successfully in $main_dir"
echo "The app will start if you run: $main_dir/startup.sh"
