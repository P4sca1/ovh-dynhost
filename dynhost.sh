#!/bin/sh

echo "Checking IP"

IP=$(dig +short myip.opendns.com @resolver1.opendns.com)
OLDIP=$(dig +short $DYNHOST_DOMAIN_NAME @resolver1.opendns.com)

if [ "$IP" ]; then 
    if [ "$OLDIP" != "$IP" ]; then 
        echo "Updating from $OLDIP to $IP"
        curl --user "${DYNHOST_LOGIN}:${DYNHOST_PASSWORD}" "http://www.ovh.com/nic/update?system=dyndns&hostname=${DYNHOST_DOMAIN_NAME}&myip=${IP}"
    else 
        echo "No update required"
    fi 
else 
    echo "IP not found"
fi
