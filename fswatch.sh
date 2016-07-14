#!/usr/bin/env bash
set -e
cd $UNISON_DIR
[ ! -z $UNISON_DIR_OWNER ] && UNISON_MANAGE_OWNER="-owner -numericids" || UNISON_MANAGE_OWNER=""
cmd="fswatch ${FSWATCH_EXCLUDES} -orIE --event Updated --event Removed --event AttributeModified --event Created --event Link --event MovedFrom --event MovedTo --event Renamed ${UNISON_DIR} | xargs -I -n1 unison $UNISON_EXCLUDES \"$UNISON_DIR\" -auto -batch $UNISON_MANAGE_OWNER socket://${HOST_IP}:${UNISON_HOST_PORT}"
echo $cmd
eval $cmd
