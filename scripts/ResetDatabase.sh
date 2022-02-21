#!/bin/sh

HOST="localhost"
USER="usracct"
PASS=""
DATABASE="RepMyBlock"

mysql -h $HOST -u $USER --password=$PASS $DATABASE -e "TRUNCATE TABLE Candidate; 
	TRUNCATE TABLE SystemUser;
	TRUNCATE TABLE SystemUserLastLogin;
	TRUNCATE TABLE SystemUserProfile;
	TRUNCATE TABLE SystemUserVoter;
	TRUNCATE TABLE SystemTemporaryUser;
"	
