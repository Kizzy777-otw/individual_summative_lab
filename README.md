# Submission Reminder App

This is an app that reminds students about their pending assignment submissions.

## Files in this repository

- `create_environment.sh` – Sets up the submission reminder environment and files.
- `copilot_shell_script.sh` – Allows updating and changing the assignment name.
- `README.md` – Instructions on how to run the application.

## How to set up and run

1. Make the setup script executable and run it:

```bash
chmod +x create_environment.sh
./create_environment.sh
```
2. Run the app in your created directory
```bash
cd submission_reminder_<name you entered in step 1>
./startup.sh```
3. If you want to change the assignment name
```bash
chmod +x copilot_shell_script.sh
./copilot_shell_script.sh```
and go back to run the ./startup.sh and check for another assignment.
