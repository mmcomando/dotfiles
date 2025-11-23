#!/bin/bash
set -uo pipefail
trap 's=$?; echo "$0: Error on line "$LINENO": $BASH_COMMAND"; exit $s' ERR
IFS=$'\n\t'
set -x

# master for 2025-11-23
REV="266792b2a4bbf7514e73225dfadb92da95f2afe1"

# Download BOSL2 library
wget https://github.com/BelfrySCAD/BOSL2/archive/${REV}.zip
unzip ${REV}.zip

# Older version might exist, remove it
rm -rf ~/.local/share/OpenSCAD/libraries/BOSL2

# Move it to selected directory
mkdir -p ~/.local/share/OpenSCAD/libraries/
mv BOSL2-${REV} ~/.local/share/OpenSCAD/libraries/BOSL2

# Clean up
rm -f ${REV}.zip