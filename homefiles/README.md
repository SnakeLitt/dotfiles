# DOTFILES 2

### .bashrc file
- first added a couple of aliases like making it to git add a file it would `ga` instead of `git  add` then added another alias for `clear` which is `c=`.  Added these two aliases from ["awesome bash aliases"](https://github.com/vikaskyadav/awesome-bash-alias)

### Script
- Made a script using [google studio ai](https://aistudio.google.com/prompts/new_chat) to help link the `.bashrc` file in my repo to the one on my computer.  
- The script downloads the `.bashrc` file from the `dotsfile` repo and replaces the `.bashrc` from user home to make sure each alias is open.  

- To run the script `sudo ./alias-bash.sh` then it will replace the old file with a new and create a backup of the file too.  If it does not work, it will show up with an error. 

- verified the script by doing `source alias-bash.sh` to make sure everything can run correctly