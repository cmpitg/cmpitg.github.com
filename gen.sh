#!/bin/sh

for FILE in *.md ; do maruku "$FILE" ; done

