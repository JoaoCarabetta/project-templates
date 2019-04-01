# Project Templates

An easy and fast way to start a project with everything that you need

## One command = folder structure and github repo 

You will be able to start a project with

`start_project [username] [project_name] [email] ["First Last_name"]`

For instance

`start_project JoaoCarabetta new_project myemail@email.com "Joao Carabetta"`

Follow [this tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e) and use the following code as your bash script:

```bash
#!/bin/bash

# Start basic project
function start_project() {
 
 username=$1
 project=$2
 email=$3
 name=$4

 echo "Creating a git ropository...";
 curl -u $username https://api.github.com/user/repos -d {\"name\":\"$project\"}

 echo "Create local repository..."
 mkdir $project
 cd $project

 echo "Downloading basic folder...";
 curl https://codeload.github.com/$username/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic

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
}
```

