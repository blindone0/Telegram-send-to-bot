#!/bin/bash

TOKEN=''


#if [ $# -ne 3 ] ; then echo 'Error! You must to define three params' && exit 1 ; fi

CHAT_ID=""
SUBJECT=$1
MESSAGE=$2

# Zabbix emoji 
if [[ $SUBJECT == 'PROBLEM' ]]
then
        ICON="\uD83D\uDE31"
elif [[ $SUBJECT == 'OK' ]]
then
        ICON="\uD83D\uDC4C"
else
        ICON="\u26A0"
fi

curl -s --header 'Content-Type: application/json' --request 'POST' --data "{\"chat_id\":\"${CHAT_ID}\",\"text\":\"$ICON ${SUBJECT}\n${MESSAGE}\"}" "https://api.telegram.org/bot${TOKEN}/sendMessage" | grep -q '"ok":false,'

