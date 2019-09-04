# Delete install.sh
rm install.sh

# Add config files to ~/.project-templates
mkdir ~/.project-templates

cd ~/.project-templates

# Doing the magic
curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/issue-22-yml | tar -xz --strip=2 project-templates-master/project-templates 

# Add executables.sh to `~/.bash_profile

if ! grep -Fxq "source ~/.project-templates/executables.sh" ~/.bash_profile 
then
    echo "source ~/.project-templates/executables.sh" >> ~/.bash_profile
fi

# Restart Terminal

echo "Please restart your terminal"