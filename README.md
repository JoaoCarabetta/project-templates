# Project Templates

An easy and fast way to start a project with everything that you need

## One command == folder structure and github repo 
> Out[1]: True!

You will be able to start a project with

`start_project [username] [project_name] [email] ["First Last_name"]`

For instance

`start_project JoaoCarabetta new_project myemail@email.com "Joao Carabetta"`

## How to install

Follow [this tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e) and use the following code as your bash script:

> Note: if you still have trouble calling the command `start_project`, follow this steps:
> 1. Go to file `nano ~./bash_profile`
> 2. Enter `[[ -s ~/.bashrc ]] && source ~/.bashrc` and save it. 
> 
> This should allow you to use the command since `./bash_profile` is called by the terminal and not `./bashrc` (make sure you have the following code in your `.my_custom_commands.sh` file, as described in the [tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e)

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

### Common issues

If you still have trouble calling the command `start_project`, follow this steps:
1. Go to file `nano ~./bash_profile`
2. Enter `[[ -s ~/.bashrc ]] && source ~/.bashrc` and save it. 

This should allow you to use the command since `./bash_profile` is called by the terminal and not `./bashrc` (make sure you have the code above in your `.my_custom_commands.sh` file, as described in the [tutorial](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e)