#!/bin/sh -e
#
# Self-modifying script that updates the version numbers
#

# The current version goes here, as the default value
VERSION=${1:-'1.1.0'}

if [ -z "$1" ]; then
  echo "The current version is $VERSION, pass the new version as the first argument if you wish to change it"
  exit 0
fi

echo "Setting the version to $VERSION"
sed -i "s/tinyxxd [[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*/tinyxxd $VERSION/g" main.c
sed -i "s/[[:digit:]]*\.[[:digit:]]*\.[[:digit:]]*/$VERSION/g" release.sh README.md "$0"
