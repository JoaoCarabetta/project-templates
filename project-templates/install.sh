# Add config files to ~/.project-templates
mkdir ~/.project-templates

cd ~/.project-templates

# TODO: change url to master
curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/issue-22 | tar -xz --strip=2 project-templates-issue-22/project-templates 

# Add executables.sh to `~/.bash_profile

if ! grep -Fxq "source ~/.project-templates/executables.sh" ~/.bash_profile 
then
    echo "source ~/.project-templates/executables.sh" >> ~/.bash_profile
fi

# Restart Terminal

echo "Please restart your terminal"
