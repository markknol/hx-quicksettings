#!/bin/sh
rm -f quicksettings.zip
zip -r quicksettings.zip quicksettings haxelib.json README.md
haxelib submit quicksettings.zip $HAXELIB_PWD --always
