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