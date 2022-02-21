#!/bin/sh

HOST="localhost"
USER="usracct"
PASS=""

/home/usracct/bin/ResetDatabase.sh
mysql -h $HOST -u $USER --password=$PASS NYSVoters < /home/usracct/Backup/BackupDevData.sql


