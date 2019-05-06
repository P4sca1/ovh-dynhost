#!/bin/sh

echo "Checking IP" >> dynhost.log

IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
OLDIP=$(dig +short $DYNHOST_DOMAIN_NAME @resolver1.opendns.com)

if [ "$IP" ]; then 
    if [ "$OLDIP" != "$IP" ]; then 
        echo "Updating from $OLDIP to $IP" >> dynhost.log
        curl --user "${DYNHOST_LOGIN}:${DYNHOST_PASSWORD}" "http://www.ovh.com/nic/update?system=dyndns&hostname=${DYNHOST_DOMAIN_NAME}&myip=${IP}" &> dynhost.log
    else 
        echo "No update required" >> dynhost.log
    fi 
else 
    echo "IP not found" >> dynhost.log
fi
