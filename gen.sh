#!/bin/sh

for FILE in *.md ; do maruku "$FILE" ; done
git add .
git commit -m "Update"
git push
