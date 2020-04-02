if [ -n "`$SHELL -c 'echo $ZSH_VERSION'`" ]; then
  # assume zsh
  # set paths for zsh files
  profile=~/.zprofile
  rc=~/.zshrc
  rcname="zshrc"
  sh="zsh"

elif [ -n "`$SHELL -c 'echo $BASH_VERSION'`" ]; then
  # assume bash
  # set paths for bash files
  profile=~/.bash_profile
  rc=~/.bashrc
  rcname="bashrc"
  sh="bash"

fi

# copy files to home directory
cp "shell/profile.sh" $profile
cp "shell/rc.sh" $rc

# replace filenames in 'profile' file
sed -i "s/bashrc/$rcname/g" $profile

# bottom line
echo "Installation was successful. Your terminal settings have been reloaded."
echo
echo -e "\e[32mTo use:\e[0m  exp [-k] \e[36mproject-name \e[0m['Project description']"

exec "$sh"