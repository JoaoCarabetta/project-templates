### How to use it


 Run the autorization and bash file:

 `chmod +x create_repo.sh && ./create_repo.sh [username] [project_name] [email] ["First Last_name"]`

 It will automatically create a repository on your local with the folder `basic` structure and a project sync on git :)


### Add to terminal as a command

Follow [this](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e)

Use this code in your bash script:


```basn
#!/bin/bash
# prints the input
function basic_project() {
  mkdir $1;
  cd $1;
  curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master
}
```
