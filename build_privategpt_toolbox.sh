#!/bin/bash

NAME=breakfree-dk-with-privategpt
RUN="toolbox run --container $NAME"

# Create container

echo -e "\n## Create $NAME container\n"

## Remove any previous containers (may show an error if it doesn't exist)
toolbox rm --force $NAME || true
## Recreate the previously deleted container
toolbox create --container $NAME

# Install applications and packages

## List of applications to be installed
APPLICATIONS="cmake gcc-c++ python3-pip"

## Install applications
$RUN sudo dnf install -y $APPLICATIONS

## Install Python packages (requires `requirements.txt` file in same 
## directory as this script)
$RUN sudo pip install -r ./requirements.txt
