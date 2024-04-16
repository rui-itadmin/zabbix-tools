#!/bin/bash
# put domain in parameter1. ssl-expire.sh will return ssl expire date of https://domain.

ssl_expire() {

sslhost=$1
date_now=$(date +%s) 
date_ssl=$(date +%s -d "$(curl -svI https://${sslhost} --stderr -  | grep 'expire date' |  grep -Eo ".{3} [ 0-9]{2} [0-9]{2}:[0-9]{2}:[0-9]{2} [0-9]{4}")")
echo $((  ( ${date_ssl} - ${date_now} ) /86400  ))

}

### main

ssl_expire $1

