#!/bin/bash

set -e

CURL=`which curl`
IFCONFIG=`which ifconfig`
GREP=`which grep`
AWK=`which awk`
DATE=`date`
TIME=`date +"%T"`


printf '\033[0;36m'"[ $TIME ] Terminal on $DATE - Yo $USER"'\033[0m\n'

processors=`cat /proc/cpuinfo | grep processor | wc -l`
printf '\033[0;36m'"[ $TIME ] Terminal - Available processors: $processors"'\033[0m\n'

get_external_ip_address ()
{
    ip=`$IFCONFIG  | $GREP 'inet adr'| $GREP -v '127.0.0.1' | cut -d: -f2 | awk '{ print $1}'`

	if [ "$ip" = "" ]; then
		printf '\033[0;36m'"[ $TIME ] Terminal - Wifi : Not connected"'\033[0m\n'
	else
        connection="wlan"
		printf '\033[0;36m'"[ $TIME ] Terminal - Wifi : $ip"'\033[0m\n'
	fi
}

get_internal_ip_address ()
{

    ip=`ifconfig | grep -E 'inet adr.[0-9]' | grep -v '127.0.0.1' | cut -d: -f2 | awk '{print $1}'`

	if [ "$ip" = "" ];then
		printf '\033[0;36m'"[ $TIME ] Terminal - LAN  : Not connected"'\033[0m\n'
	else
		printf '\033[0;36m'"[ $TIME ] Terminal - LAN  : $ip"'\033[0m\n'
        connection="eth"
	fi
}

#get_external_ip_address
#get_internal_ip_address

## get the current number of bytes in and bytes out
#myvar1=`netstat -i | grep -e $connection -m 1 | awk '{print $4}'` #  bytes in
#myvar3=`netstat -i | grep -e $connection -m 1 | awk '{print $8}'` # bytes out

##wait one second
#sleep 1

## get the number of bytes in and out one second later
#myvar2=`netstat -s | grep -e $connection -m 1 | awk '{print $4}'` # bytes in again
#myvar4=`netstat -s | grep -e $connection -m 1 | awk '{print $8}'` # bytes out again

## find the difference between bytes in and out during that one second
#subin=$(($myvar2 - $myvar1))
#subout=$(($myvar4 - $myvar3))

## convert bytes to kilobytes
#kbin=`echo "scale=2; $subin/1024;" | bc`
#kbout=`echo "scale=2; $subout/1024;" | bc`

## print the results
#printf '\033[0;36m'"[ $TIME ] Terminal - Up   : $kbout Kb/sec"'\033[0m\n'
#printf '\033[0;36m'"[ $TIME ] Terminal - Down : $kbin Kb/sec"'\033[0m\n'

#raspberry_connection=`nmap 192.168.0.22 -PN -p ssh | egrep 'open|closed|filtered'`
#server_connection=`nmap 192.168.0.17 -PN -p ssh | egrep 'open|closed|filtered'`
## print the results
#printf '\033[0;36m'"[ $TIME ] Terminal - Connection::Raspbery : $raspberry_connection"'\033[0m\n'
#printf '\033[0;36m'"[ $TIME ] Terminal - Connection::Server   : $server_connection"'\033[0m\n'
