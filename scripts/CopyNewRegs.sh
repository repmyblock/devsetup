#!/bin/sh

HOST="<REMOTE DATABASE IP>"
PORT="<REMOTE DATABASE PORT>"
USER="<REMOTE DATABASE USERNAME>"
PASS=""

LOCAL_HOST="localhost"
LOCAL_USER="usracct"
LOCAL_PASS=""

mysqldump --add-drop-table -h $HOST -u $USER --port=$PORT --password=$PASS RepMyBlock SystemUserEmail| mysql -h $LOCAL_HOST -u $LOCAL_USER --password=$LOCAL_PASS RepMyBlock 
