#!/usr/bin/env bash

read -p "Install pre-requisites? (pyenv, pyenv-virtualenv)"

read -p "Enter main project folder name: " new_project_name
echo "renaming project to $new_project_name"

# rename project
find . -iname '*.py' -o -iname '*.env' -o -iname '*.yml' -exec sed -i "" -e "s/projectname/${new_project_name}/g" {} \;
mv projectname $new_project_name

# copy .env variables
cp dev.env .env

# regenerate secret key
