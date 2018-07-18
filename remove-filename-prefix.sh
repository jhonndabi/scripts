#!/usr/bin/env bash

# Based on:
# https://www.larshaendler.com/2013/07/08/multiple-files-remove-prefix/
# https://stackoverflow.com/a/5458777
# https://frightanic.com/software-development/regex-match-last-occurrence/

EXTENSION=".*"
DEPTH=1

for i in "$@"; do
    case $i in
        -p=*|--prefix=*)
        PREFIX="${i#*=}"
        ;;

        -e=*|--extension=*)
        EXTENSION=".${i#*=}"
        ;;

        -d=*|--depth=*)
        DEPTH="${i#*=}"
        ;;
    esac
done

if [[ -z "$PREFIX" ]]; then
	echo "The arguments are invalids, please check the script."
	exit 1
fi

PREFIXED_FILES=`find . -maxdepth $DEPTH -type f -name "$PREFIX*$EXTENSION" -exec realpath {} \;`

for i in $PREFIXED_FILES; do
    mv "$i" $(echo $i | sed -r "s/(.*)$PREFIX(.*)/\1\2/");
done