#!/bin/bash

username=$1
project=$2
email=$3
name=$4

echo "Creating a git ropository...";
curl -u $username https://api.github.com/user/repos -d {\"name\":\"$project\"}

echo "Downloading basic folder...";
curl https://codeload.github.com/fernandascovino/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic

echo "Inicialize git and set remote...";
git init
git remote add origin http://github.com/$username/$project.git

echo "Set user's config...";
git config user.name $name
git config user.email \"$email\" 

echo "Adding changes and initial commit...";
git add .
git commit -m "initial commit: folder structure"

echo "Uploading changes...";
git push --set-upstream origin master

echo "Done!";
