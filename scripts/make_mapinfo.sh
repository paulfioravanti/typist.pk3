#!/bin/bash

# This script searches for event handlers in files specified by $search_pattern
# in the current directory and its subdirectories.
# The found event handlers are written to $file_name in mapinfo format.

search_pattern="*.zs"
file_name=mapinfo.txt

event_handlers=$(find zscript -name "$search_pattern" \
    | while read -r f; do ggrep -iroP "(?<=class ).*(?=:.*EventHandler)" "$f"; done \
    | gsed 's|\(\w\w*\)|\"\1\"|g' \
    | tr -d '\n' \
    | gsed 's|"\s*"|",\n    "|g')

contents="// This file is generated by scripts/make_mapinfo.sh.
// Any changes to it may be overwritten.

gameinfo
{

  AddEventHandlers = $event_handlers

} // gameinfo"

echo -e "$contents" > $file_name
