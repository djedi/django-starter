#!/usr/bin/env bash

read -p "Enter project name: " new_project_name
echo "renaming project to $new_project_name"

find . -name '*.py' -exec sed -i -e "s/projectname/${new_project_name}/g" {} \;

# copy .env variables
cp dev.env .env

# regenerate secret key
