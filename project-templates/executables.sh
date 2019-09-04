#!/bin/bash

# Start basic project
!/bin/bash

# Start basic project
function start_project() {

   printf "\n>>> Creating a git ropository...\n";

   printf ">>> What will be the name of your project?\n"
   read project
   printf ">>> Do you want to use credentials from config.yaml? [Y/N]\n"
   read credentials

   if [ $credentials = 'Y' ]
   then
       read -r name <<<$(grep name config.yaml)
       read -r username <<<$(grep username config.yaml)
       read -r email <<<$(grep email config.yaml)
   else [ $credentials = 'N']
       printf "\n>>> Enter your GitHub username: www.github.com/<USERNAME>/\n"
       read username
       printf "\n>>> And also your name with \" - like \"Fernanda Scovino\":\n"
       read name
       printf "\n>>> Please, enter your GitHub email:\n"
       read email
   fi

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
