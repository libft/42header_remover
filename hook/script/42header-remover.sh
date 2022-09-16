#!/bin/sh

set -e

FILE_NAME="fake_file_name (file name is useless too)    "
# FILE_NAME="$(basename $1)$(printf %45.45s)" # uncomment when norminette starts complain it
PLACEHOLDER="PLACEHOLDER_FOR_FILE_NAME_UP_TO_45_CHARACTERS"

if [ "$(grep -zEc \\/\\\*\ \\\*\{74\}\ \\\*\\/\\n\\/\\\*.\*\\\*\\/\\n\\/\\\*.\*\\\*\\/\\n\\/\\\*.\{3\}\(\[\^\ \]\*\).\*\\\*\\/\\n\\/\\\*.\*\\\*\\/\\n\\/\\\*\ \ \ By:\ \(\[\^\ \]\*\).\*\\\*\\/\\n\\/\\\*.\*\\\*\\/\\n\\/\\\*\ \ \ Created:\ \(\[\^\ \]\*\ \[\^\ \]\*\)\ by\ \(\[\^\ \]\*\).\*\\\*\\/\\n\\/\\\*\ \ \ Updated:\ \(\[\^\ \]\*\ \[\^\ \]\*\)\ by\ \(\[\^\ \]\*\).\*\\\*\\/\\n\\/\\\*.\*\\\*\\/\\n\\/\\\*\ \\\*\{74\}\ \\\*\\/\\n < "$1")" = "1" ] ; then
  sed "s/$PLACEHOLDER/$FILE_NAME/" < hook/assets/42header-c-template.txt > "$1.tmp"
  tail -n +12 "$1" >> "$1.tmp"
  mv "$1" "$1.bak"
  mv "$1.tmp" "$1"
  rm -f "$1.bak"
  git add "$1"
fi
