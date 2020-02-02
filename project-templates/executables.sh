#!/bin/bash

# Start basic project
!/bin/bash

# Start basic project
function start_project() {

    printf "\n>>> Creating a git ropository...\n";

    printf ">>> What will be the name of your project?\n";
    read project

    printf ">>> Do you want to use the credentials from config.yaml? [Y/N]\n";
    read bool

    if [ $bool = "Y" ]
    then
        read -r name <<<$(grep name config.yaml)
        name=${name//*name: /};
        read -r user <<<$(grep user config.yaml)
        user=${user//*user: /};
        read -r email <<<$(grep email config.yaml)
        email=${email//*email: /};
        read -r token <<<$(grep token config.yaml)
        token=${token//*token: /};
        printf "All done!\n\n"
    else
        printf "\n>>> Enter your GitHub username: www.github.com/<USERNAME>/\n";
        read user
        printf "\n>>> And also your name - like Fernanda Scovino:\n";
        read name
        printf "\n>>> Please, enter your GitHub email:\n";
        read email
        printf "\n>>> And insert your token (this will be visible only to you):\n";
        read token
        printf "\n>>> Do you want to save this credentials in config.yaml for futher use? [Y/N]\n"
        read saving

        if [ $saving == "Y" ]
        then
            echo -n > config.yaml
            echo "name: \"${name}\"" >> config.yaml
            echo "user: ${user}" >> config.yaml
            echo "email: ${email}" >> config.yaml
            echo "token: ${token}" >> config.yaml
        printf "Done! Next time, just use the credentials from config.yaml :) \n"
        fi
    fi

    curl -u $user:$token https://api.github.com/user/repos -d {\"name\":\"$project\"}

    printf "\n>>>> Great! Creating local repository...\n"
    mkdir $project
    cd $project

    printf "\n>>> Downloading basic folder...\n";
    curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic

    printf "\n>>> Inicializing git and setting remote...\n";
    git init
    git remote add origin http://github.com/$user/$project.git

    echo "\n>>> Almost Done! Setting user's config...\n";
    git config user.name $name
    git config user.email \"$email\"

    printf "\n>>> Adding changes and initial commit...\n";
    git add .
    git commit -m "initial commit: folder structure"

    printf "\n>>> Uploading changes...\n";
    git push --set-upstream origin master

    printf "\n>>> Setting up virtual environment\n"
    python3 -m venv .venv
    source .venv/bin/activate
    pip install -r requirements.txt

    printf "\n>>> All done! :D (to exit venv, enter deactivate on terminal)\n";
}
