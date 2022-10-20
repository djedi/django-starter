#!/usr/bin/env bash

read -p "Enter project name: " new_project_name
echo "renaming project to $new_project_name"

# rename project
find . -name '*.py' -exec sed -i -e "s/projectname/${new_project_name}/g" {} \;
find . -name '*.py-e' -delete
mv projectname $new_project_name

# copy .env variables
cp dev.env .env

# regenerate secret key
