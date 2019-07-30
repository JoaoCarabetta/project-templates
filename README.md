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
!/bin/bash

# Start basic project
function start_project() {

    printf "\n>>> Creating a git ropository...";

    printf ">>> What will be the name of your project?\n"
    read project
    printf "\n>>> Enter your GitHub username: www.github.com/<username>/<repo>\n"
    read username
    printf "\n>>> And also your name with \" - like \"Fernanda Scovino\":\n"
    read name
    printf "\n>>> Please, enter your GitHub email:\n"
    read email

    curl -u $username https://api.github.com/user/repos -d {\"name\":\"$project\"}

    printf "\n>>>> Great! Creating local repository...\n"
    mkdir $project
    cd $project

    printf "\n>>> Downloading basic folder...\n";
    curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic

    printf "\n>>> Inicializing git and set remote...\n";
    git init
    git remote add origin http://github.com/$username/$project.git

    echo "\n>>> Thank you! Setting user's config...\n";
    git config user.name $name
    git config user.email \"$email\"

    printf "\n>>> Adding changes and initial commit...\n";
    git add .
    git commit -m "initial commit: folder structure"

    printf "\n>>> Uploading changes...\n";
    git push --set-upstream origin master

    printf "\n>>> Setting up virtual environment\n"
    python3 -m venv $project
    source $project/bin/activate
    pip install -r requirements.txt

    printf "\n>>> All done! :D (to exit venv, enter deactivate on terminal)\n";
}
```

### Common issues

If you still have trouble calling the command `start_project`, follow these steps:
1. Go to file `nano ~/.bash_profile`
2. Enter `[[ -s ~/.bashrc ]] && source ~/.bashrc` and save it. 

This should allow you to use the command since `/.bash_profile` is called by the terminal and not `/.bashrc` (make sure you have the code above in your `.my_custom_commands.sh` file, as described in the [tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e)
