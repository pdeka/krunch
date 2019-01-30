#!/bin/bash

# while getopts 'a:' c
# do
#   case $c in
#     a) API_KEY=$OPTARG ;;
#   esac
# done

FOLDER=$HOME"/Pictures/Kenekt/Photos"
BACKUP_BASE=$HOME"/Pictures/Kenekt/Backup"
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

# echo "--------------------------------------------------------------------------"
# echo "API_KEY: "$API_KEY
# echo "FOLDER: "$FOLDER
# echo "BACKUP_BASE: "$BACKUP_BASE
# echo "DIR: "$DIR
# echo "HOME: "$HOME
# echo "--------------------------------------------------------------------------"
#

mkdir -p -v $FOLDER
mkdir -p -v $BACKUP_BASE

command -v php >/dev/null 2>&1 || { echo >&2 "PHP required but not installed.  Aborting."; exit 1; }

read -r API_KEY < $HOME/.kenekt/shortpixel.key

if [ -z "$API_KEY" ]
then
      echo "\$API_KEY is empty"
fi

cd $DIR/shortpixel-php-master/lib
php cmdShortpixelOptimize.php --apiKey=$API_KEY --folder=$FOLDER --backupBase=$BACKUP_BASE
