#!/bin/sh

echo "Simulate registration email"

if [ -n "$1" ]; then
	MAILSTRING=`date | md5sum | head -c 10 | tr [:lower:] [:upper:]`
	SQL="SELECT SystemUserEmail_ID FROM SystemUserEmail WHERE SystemUserEmail_AddFrom = '$1'"
	RESULT=`mysql RepMyBlock -e "${SQL}"`
	
	if [ -n "${RESULT}" ]; then
		echo "The email $1 already exist, can't be addded";
	else
		SQL="INSERT INTO SystemUserEmail SET SystemUserEmail_AddFrom = '$1', \
					SystemUserEmail_AddTo = 'notif@repmyblock.org', \
					SystemUserEmail_MailCode = '${MAILSTRING}', \
					SystemUserEmail_Reason = '', \
					SystemUserEmail_Concluded	= 'yes', \
					SystemUserEmail_Received = NOW()"				
		mysql RepMyBlock -e "${SQL}"
	fi
fi