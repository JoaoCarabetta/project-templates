### Create a terminal command to start a project

You will be able to start a project with

`start_project [username] [project_name] [email] ["First Last_name"]`


Follow [this](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e) and use this code in your bash script:

```bash
#!/bin/bash
# prints the input
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
}
```

### How to use it


 Run the autorization and bash file:

 `chmod +x create_repo.sh && ./create_repo.sh [username] [project_name] [email] ["First Last_name"]`

 It will automatically create a repository on your local with the folder `basic` structure and a project sync on git :)

