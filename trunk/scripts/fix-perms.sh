#!/bin/sh

set -e

if [ -z "$1" -o -z "$2" ]
    then
    echo "usage: $0 PKG_INSTALL_DIR PERM_FILE" 1>&2
    exit 1
fi

PKG_TMP="$1"
PERM_FILE="$2"

cd $PKG_TMP

chown -R root:root .
find . -type d -print | xargs chmod 755

if test -f "$PERM_FILE"
    then
    while read path user group mode
      do
      echo "PERM: $path $user:$group $mode"
      chown ${user}:${group} $path
      chmod $mode $path
    done <$PERM_FILE
fi
