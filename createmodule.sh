#!/bin/bash
#title:        createmodule.sh
#authot:       Jon Hoffman
#description:  Creates the directories and files need for a Swift module
#date:         012816
#version:      1.0
#usage:        createmodule.sh {module name} {optional: dir name}

MODULENAME=""
DIRNAME=""	
PACKAGEFILENAME="Package.swift"
MODULEFILENAME="module.modulemap"

#Check to make sure at least one command
#line arg is present otherwise exit script
if [ $# -le 0 ]; then
    echo "Usage: creatproject {Name for Module} {Optional directory name}"
    exit 1
fi

#Assign the value of the first command line arg to the module name
#if a second command line arg is present assign that value to the
#the directory name otheerwise use the module name
MODULENAME=$1
if [ "$1" != "" ]; then
    DIRNAME=$1
else
    DIRNAME=$MODULENAME
fi

#Check to see if the directory exists and if so display an error
#and exit
if [ -d "$DIRNAME" ]; then
    echo "Directory already exists, please choose another name"
    exit 1
fi

#Make the directory structue and create the neccessary files
mkdir -p $DIRNAME

cd $DIRNAME
touch $PACKAGEFILENAME
touch $MODULEFILENAME

echo "module $MODULENAME [system] {" >> $MODULEFILENAME
echo "" >> $MODULEFILENAME
echo "}" >> $MODULEFILENAME

git init
git add .
git commit -m "Initial Import"
git tag 0.0.1

