This is an app that reminds students about their pending assignment submissions.

## Files in this repository

- `create_environment.sh` – Sets up the submission reminder environment and files.
- `copilot_shell_script.sh` – Allows updating and changing the assignment name.
- `README.md` – Instructions on how to run the application.

## How to set up and run

1. Run the create_environment scipt first :

```bash
./create_environment.sh
```
2. From the prompt you can copy paste the suggested code or sun it in the created directory
```bash
cd submission_reminder_<name you entered in step 1>
./startup.sh
```
3. If you want to change the assignment name use the suggested code from the create_environment scipt or run it in the created directory with the following code
```bash
chmod +x copilot_shell_script.sh
./copilot_shell_script.sh
```
and go back to run the ./startup.sh and try using the app to check information fot another assignment.

