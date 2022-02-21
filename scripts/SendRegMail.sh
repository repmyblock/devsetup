#!/bin/sh

### Script to batch registration email with the prod server

if [ -n "$1" ]; then
	echo "Sending email as $1"
	echo "Hello There" | mail -s "I want to run" -r $1 notif@repmyblock.org 
fi
