#!/usr/bin/env bash

declare -x PYTHON_VERSION=3.10.7
declare -x PREREQS="pyenv pyenv-virtualenv"

read -p "Install pre-requisites? ($PREREQ)"

read -p "Enter main project folder name: " new_project_name
declare -x venv_name="${new_project_name}_env"
echo "renaming project to $new_project_name"

# rename project
find . -exec sed -i "" -e "s/projectname/${new_project_name}/g" {} \;
mv projectname $new_project_name

# copy .env variables
cp dev.env .env

# Set up virtualenv
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"
pyenv install $PYTHON_VERSION
pyenv virtualenv 3.10.7 $venv_name
pyenv local $venv_name
pip install --upgrade pip
pip install -r requirements/dev.txt


# regenerate secret key
key1=$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')
key2=$(python -c 'from django.core.management.utils import get_random_secret_key; print(get_random_secret_key())')
SETTINGS_FILE="./$new_project_name/settings/__init__.py"
echo "DJANGO_SECRET_KEY=\"$key1\"" >> .env
sed "s/django-insecure/django-insecure-${key2}/" $SETTINGS_FILE > $SETTINGS_FILE

# Setup new git repo
rm -rf .git
git init
