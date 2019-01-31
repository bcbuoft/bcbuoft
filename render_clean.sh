#!/bin/bash

#save calling location
callingDir=$PWD

#switch to docs directory
cd ~/Documents/bcbuoft/docs/

#clean up unwanted rendered files
rm README.html
rm render_clean.sh
rm bootstrap.css

#hack fix page titles

#remove old
ex -s -c '14d' -c x index.html
ex -s -c '14d' -c x about.html

#set new
ex -s -c '14i|<title>BCBSU - home</title>' -c x index.html
ex -s -c '14i|<title>BCBSU - about</title>' -c x about.html


#add favicon line
LIST=*.html
for file in $LIST
do 
ex -s -c '13i|<link rel="icon" href="https://bcbuoft.github.io/files/favicon.ico"/>' -c x $file
done


#return to calling location
cd $callingDir
