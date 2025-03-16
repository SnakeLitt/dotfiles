#!/bin/bash

# Script to link a .bashrc file from GitHub to your user directory.

# --- Configuration ---
github_username="SnakeLitt"  # Replace with your GitHub username
github_repo="dotfiles"          # Replace with the name of your repository
bashrc_filepath="~/git/dotfiles/.bashrc"       # Replace with the path to your .bashrc file within the repo

# --- Script Logic ---

# 1. Backup existing .bashrc (if it exists)
if [ -f "$HOME/.bashrc" ]; then
  echo "Backing up existing .bashrc to .bashrc.bak"
  mv "$HOME/.bashrc" "$HOME/.bashrc.bak"
fi

# 2. Construct the GitHub raw URL
github_raw_url="https://raw.githubusercontent.com/$github_username/$github_repo/main/$bashrc_filepath" # Assuming main branch

#Check if the branch is "main", if not replace with "master"
if ! curl -s -o /dev/null -w "%{http_code}" "$github_raw_url" | grep -q "200"; then
  github_raw_url="https://raw.githubusercontent.com/$github_username/$github_repo/master/$bashrc_filepath" # Assuming master branch if main fails
fi

# 3. Download the .bashrc file from GitHub
echo "Downloading .bashrc from GitHub: $github_raw_url"
if curl -s -o "$HOME/.bashrc" "$github_raw_url"; then
  echo ".bashrc downloaded successfully."
else
  echo "Error: Failed to download .bashrc from GitHub."
  # Restore the backup if the download failed.
  if [ -f "$HOME/.bashrc.bak" ]; then
    echo "Restoring backup .bashrc"
    mv "$HOME/.bashrc.bak" "$HOME/.bashrc"
  fi
  exit 1 # Exit with an error code.
fi

# 4. Source the new .bashrc (optional)
echo "Sourcing the new .bashrc file."
source "$HOME/.bashrc"

echo "Done!  Your .bashrc file has been updated."
echo "You may need to open a new terminal for the changes to fully take effect."

exit 0 # Exit with success code
