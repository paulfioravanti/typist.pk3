#!/bin/bash

# This script searches for event handlers in files specified by $searchpattern
# in the current directory and its subdirectories.
# The found event handlers are written to $filename in mapinfo format.

searchpattern="*.zs"
filename=mapinfo.txt

contents=\
"// This file is generated by scripts/make_mapinfo.sh.\n"\
"// Any changes to it may be overwritten.\n"\
"\n"\
"gameinfo\n"\
"{\n\n"\
"  AddEventHandlers = "\
$(echo $(find . -name "$searchpattern" | while read f; do grep -iroP "(?<=class ).*(?=:.*EventHandler)" $f; done)\
| sed 's/\(\w*\)/\"\1\"/g' | sed 's/" "/",\n  "/')\
"\n\n} // gameinfo"

echo -e "$contents" > $filename
