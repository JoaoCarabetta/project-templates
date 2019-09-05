#!/bin/bash

# Start basic project

# Start basic project
function start_project() {

   printf "\n>>> Creating a git ropository...\n";

   printf ">>> What will be the name of your project?\n"
   read PROJECT
   printf ">>> Do you want to use credentials from config.yaml? [Y/N]\n"
   read BOOL

   if [ $BOOL = 'Y' ]
   then
        # Read credentials file
        . ~/.project-templates/credentials.config

    else [ $BOOL = 'N' ]
       printf "\n>>> Enter your GitHub username: www.github.com/<USERNAME>/\n"
       read USER
       printf "\n>>> And also your name with \" - like \"Fernanda Scovino\":\n"
       read NAME
       printf "\n>>> Please, enter your GitHub email:\n"
       read EMAIL
   fi

   curl -u $USER https://api.github.com/user/repos -d {\"name\":\"$PROJECT\"}

   printf "\n>>>> Great! Creating local repository...\n"
   mkdir $PROJECT
   cd $PROJECT

   printf "\n>>> Downloading basic folder...\n";
   curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic

   printf "\n>>> Inicializing git and set remote...\n";
   git init
   git remote add origin http://github.com/$USER/$PROJECT.git

   echo "\n>>> Thank you! Setting user's config...\n";
   git config user.name $NAME
   git config user.email \"$EMAIL\"

   printf "\n>>> Adding changes and initial commit...\n";
   git add .
   git commit -m "initial commit: folder structure"

   printf "\n>>> Uploading changes...\n";
   git push --set-upstream origin master

   printf "\n>>> Setting up virtual environment\n"
   python3 -m venv $PROJECT
   source $PROJECT/bin/activate
   pip install -r requirements.txt

   printf "\n>>> All done! :D (to exit venv, enter deactivate on terminal)\n";
}

start_project

