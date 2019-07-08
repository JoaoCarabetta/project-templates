#!/bin/bash

# Start basic project
function start_project() {

    echo "Creating a git ropository...";

    echo "Enter your username:"
    read username
    echo "What will be the name of your project?"
    read project

    curl -u $username https://api.github.com/user/repos -d {\"name\":\"$project\"}

    echo "Great! Creating local repository..."
    mkdir $project
    cd $project

    echo "Downloading basic folder...";
    curl https://codeload.github.com/fernandascovino/project-templates/tar.gz/master | tar$

    echo "Inicializing git and set remote...";
    git init
    git remote add origin http://github.com/$username/$project.git

    echo "Please, enter your email:"
    read email
    echo "And also your name with \" - like \"Fernanda Scovino\":"
    read name

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
