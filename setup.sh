#!/usr/bin/env bash

read -p "Enter project name: " new_project_name
echo "renaming project to $new_project_name"

find . -name '*.py' -exec sed -i -e "s/projectname/$newprojectname/g" {} \;
