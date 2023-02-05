#!/bin/bash

# This script writes a title with version to language lump.
#
# Usage:
# ./scripts/make_title.sh

version=$(git describe --abbrev --tags --always)
gsed -i "s/TT_TITLE.*/TT_TITLE = \"Typist.pk3 $version\";/" language.txt
