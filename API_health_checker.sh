#!/bin/bash

count=0
timeoutThreshold=$(($2/5))

siteIsOk=""
until [[ "$siteIsOk" =~ "200 OK" ]]
do
    ((count++))

    siteIsOk=$(curl -s --head --request GET $1 | grep "200 OK";)
    if [[ "$siteIsOk" =~ "200 OK" ]]; then 
    echo "Site is OK!"
    else
    echo "Site not available yet. Retrying in 5 seconds."
    sleep 5s
    fi

    if [ $count -gt $timeoutThreshold ]; then
        echo "Timed out after 60 seconds. The Site may be down, please check!"
        exit 1
    fi
done