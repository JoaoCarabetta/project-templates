#!/bin/bash

# Start basic project
function start_project() {

    echo "Creating a git ropository...";

    echo "What will be the name of your project?"
    read project
    echo "Enter your GitHub username: www.github.com/<username>/<repo>"
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

    echo "Setting up virtual envoriment"
    python3 -m venv $project
    source $project/bin/activate
    pip install -r requirements.txt

    echo "Done!";
}