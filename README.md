# 🚀 Project Templates 💥

An easy and fast way to start a project with everything that you need.

## One command == folder structure and github repo ✅
> Out[1]: True!

You will be able to start a project with `start_project` and enter your infos.

## How to install 🧐

**1.** Make sure you have a token for Github API

> The token is now needed in order to create and push to your repositories via terminal. If you don't have one:
> - Go to https://github.com/settings/tokens
> - Select _Generate new token_
> - Add a _Note_ to remind future you what this token is about
> - On _Select scopes_, check _repo_
> - Generate token at the end of the page, and don't forget to save it!

**2.** Run this line

`curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/install/; chmod +x install.sh; ./install.sh; source ~/.bash_profile;`

**3.** Run `start_project` and let the magic happen

## I don't want to install anything, gimme the oneliner 

Create a new project folder, get into it and run

`curl https://codeload.github.com/JoaoCarabetta/project-templates/tar.gz/master | tar -xz --strip=2 project-templates-master/basic`
