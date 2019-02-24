### Download Basic

cd to dir and

`curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic`

### Add to terminal

Follow [this](https://medium.com/devnetwork/how-to-create-your-own-custom-terminal-commands-c5008782a78e)

Use this code in your bash script:


```basn
#!/bin/bash
# prints the input
function basic_project() {
  mkdir $1;
  cd $1;
  curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/maste$
}
```
