#! /bin/sh

OPENAPSROOT="/root/myopenaps"
REASON=$1
TARGET=$2
DURATION=$3

echo "\
[{\"_id\":\"\",\"enteredBy\":\"\",\"eventType\":\"Temporary Target\",\"reason\":\"$REASON\",\"targetTop\":$TARGET,\"targetBottom\":$TARGET,\"duration\":$DURATION,\"created_at\":\"$(date --utc +'%Y-%m-%dT%H:%M:%S.000Z')\",\"carbs\":null,\"insulin\":null}] \
" > $OPENAPSROOT/settings/temptargets.json
cd $OPENAPSROOT
openaps report invoke settings/profile.json
echo "Temporary target started"
