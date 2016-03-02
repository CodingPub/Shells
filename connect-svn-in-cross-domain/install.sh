#!/bin/sh


DEST_DIR=/Library/StartupItems
DES_PATH=$DEST_DIR"/AddRoutes"
CURRENT_DIR=$PWD

if [ -d $DES_PATH ]; then
echo "delete old directory $DES_PATH"
rm -rf $DES_PATH
fi

if [ ! -d $DEST_DIR ]; then
echo "create directory $DEST_DIR"
mkdir -p $DEST_DIR
fi

cp -rf $CURRENT_DIR"/StartupItem" $DES_PATH

chown -R root:wheel $DES_PATH
chmod -R 755 $DES_PATH

$DES_PATH"/AddRoutes" "start"

exit 0