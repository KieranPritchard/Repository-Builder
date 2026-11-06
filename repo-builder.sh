#!/usr/bin/env bash

# Checks if the user provided the required arguments (repo_name and language). If not, it prints a usage message and exits with an error code.
if [ -z "$1" ]; then
  echo "Usage: $0 <repo_name>"
  exit 1
fi

if [ -z "$2" ]; then
  echo "Usage: $0 <repo_name> <language>"
  exit 1
fi

# Assigns the first argument to the variable REPO_NAME and the second argument to the variable LANGUAGE.
REPO_NAME=$1
LANGUAGE=$2

# Creates a new directory with the name of the repository and navigates into it.
mkdir "$REPO_NAME"
cd "$REPO_NAME"

# Creates a new repository on GitHub using the GitHub CLI (gh) and initializes a local Git repository.
gh repo create "$REPO_NAME" --public --source=. --remote=origin --push

# Checks the value of the LANGUAGE variable and creates a basic project structure based on the specified programming language.
case "$LANGUAGE" in
    laravel)
        echo "Creating a laravel project structure..."
        composer create-project laravel/laravel api
        cd api
        php artisan install:api      # installs Sanctum + routes/api.php
        php artisan migrate
        cd ..
        npm create vite@latest web -- --template react-ts
        cd web
        npm install axios react-router-dom
        ;;
    react)
        echo "Creating a React project..."
        npm create vite@latest web -- --template react-ts
        cd web
        npm install axios react-router-dom
        cd ..
        mkdir api
        cd api
        echo "Creating a Node.js project..."
        npm init -y
        npm install express cors
        ;;
    *)
        echo "Unsupported language: $LANGUAGE"
        exit 1
        ;;
esac
