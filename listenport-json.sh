#!/bin/bash
# 2024-04-14
# read listen port from ss 
# convert it to json with format "PORT":"PORTNUMBER"
# [zabbix doc lld](https://www.zabbix.com/documentation/current/en/manual/discovery/low_level_discovery)

listenport=$( ss -tln4H | awk '{print $4}' | cut -d":" -f2 )
portlist=($listenport) # to array

# start with json array "["
json="["

for portnumber in "${portlist[@]}"; do
    json+='{"{#PORT}":"'$portnumber'"},'
    # data format = {"PORT" : "PORTNUMBER" }     

done

json=${json%,}  # remove last ,
json+="]"

echo "$json"

