#!/bin/sh
if [ -z $1 ]; then
  echo "Usage: runit.sh [GCompris activity directory]"
  exit 1
fi

path=`dirname $0`
. $1/init_path.sh

if [ ! -f $localedir ]; then
  localedir=/usr/share/locale
fi

if [ ! -d $plugindir ]; then
  plugindir=$path
fi

gcompris=$1/gcompris.bin
if [ ! -f $gcompris ]; then
  gcompris=$1/../gcompris/gcompris
fi

$gcompris -L $plugindir \
    -P $pythonplugindir \
    -A $resourcedir \
    --config-dir=$configdir \
    -M $menudir \
    --locale_dir=$path/locale \
    -l /puzzle/$activity $*
