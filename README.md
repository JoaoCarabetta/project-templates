# Project Templates

An easy and fast way to start a project with everything that you need

## One command == folder structure and github repo 
> Out[1]: True!

You will be able to start a project with `start_project` and enter your infos.

## How to install

Follow [this tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e) and use the following code as your bash script:

```bash
#!/bin/bash

# Start basic project
function start_project() {

    echo "Creating a git ropository...";

    echo "What will be the name of your project?"
    read project
    echo "Enter your GitHub username:"
    read username
    echo "And also your name with \" - like \"Fernanda Scovino\":"
    read name
    echo "Please, enter your GitHub email:"
    read email

    curl -u $username https://api.github.com/user/repos -d {\"name\":\"$project\"}

    echo "Great! Creating local repository..."
    mkdir $project
    cd $project

    echo "Downloading basic folder...";
    curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic

    echo "Inicializing git and set remote...";
    git init
    git remote add origin http://github.com/$username/$project.git

    echo "Thank you! Setting user's config...";
    git config user.name $name
    git config user.email \"$email\"

    echo "Adding changes and initial commit...";
    git add .
    git commit -m "initial commit: folder structure"

    echo "Uploading changes...";
    git push --set-upstream origin master

    echo "Done!";
}


```

### Common issues

If you still have trouble calling the command `start_project`, follow these steps:
1. Go to file `nano ~/.bash_profile`
2. Enter `[[ -s ~/.bashrc ]] && source ~/.bashrc` and save it. 

This should allow you to use the command since `/.bash_profile` is called by the terminal and not `/.bashrc` (make sure you have the code above in your `.my_custom_commands.sh` file, as described in the [tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e)
