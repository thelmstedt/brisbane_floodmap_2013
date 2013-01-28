#!/usr/bin/env bash

file=$1
IFS=$'\n';
for x in `cat $file`
do
    address=`echo $x | awk -F"\t" '{print $1}' | sed 's/ /\+/g'`
    curl --silent http://maps.googleapis.com/maps/api/geocode/json\?sensor=false\&address\=$address > /tmp/response.json
    sleep .1
    latlng=`python read_geocode.py`
    printf "$x\t$latlng\n"
    rm /tmp/response.json
done
