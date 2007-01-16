#!/bin/sh

set -e

if [ $# -ne 2 ]
    then
    echo "usage: $0 MODULES_DIR BUILTIN_LIST_FILE" >&2
    exit 1
fi

D="$1"
LIST="$2"
T="$(mktemp -d /tmp/kernel-builtin-mod-split.XXXXXX)"

cleanup()
{
    rm -rf $T
}

trap cleanup 0
trap cleanup 1
trap cleanup 2
trap cleanup 3
trap cleanup 15

sort $LIST > $T/builtin.list

cd $D
test -d kernel
find kernel -type f | sort > $T/all.list

comm -1 -3 $T/builtin.list $T/all.list >$T/external.list
mkdir -p ./external

test \! -s $T/external.list && exit 0

for i in $(cat $T/external.list)
  do
  DIR="`dirname $i`"
  mkdir -p ./external/$DIR
  mv $i ./external/$DIR
  echo "External module: $i"
done

find kernel -type d -empty | xargs rmdir || true

exit 0
