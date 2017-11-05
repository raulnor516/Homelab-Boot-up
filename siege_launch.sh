#!/bin/bash

uflag=
pflag=

if (($# == 0));
    then printf "No options given, use [-u username] and [-p password]. \n" >&2
    exit 2
fi

while getopts ':u:p:' CRED
do
    case $CRED in
        u)  uflag=1
            username="$OPTARG"
            ;;
        p)  pflag=1
            password="$OPTARG"
            ;;
        /?) printf "&OPTARG isn't a viable option. Use [-u username] and [-p password]. \n" $(basename $0) >&2
        #So that last line just gives some error handling if bad switches are given.
        #The basename $0 thing is supposed to return the name of the script that errored, to stderror
            exit 2
            ;;
        /:) printf "You need to supply credentials after &OPTARG. \n" $(basename $0) >&2
        # If someone provides a -u or -p without text after it, this will tell them to add info
            exit 2
            ;;
    esac
done
shift $(($OPTIND -1))

if [ "${uflag}${pflag}" ]
    then printf "Passing username '$username' and password '$password' to ipmitool and amt. \n"
fi

#if [[ ! -f ipmi_targs.txt ]]; then 
#	echo  

for ipmi_host in `cat ipmi_targs.txt`; 
	do 
        ipmitool -U $username -P $password -H $ipmi_host chassis power on
        printf "$ipmi_host powered on! \n"
        sleep 1.5s
done

printf "All IPMI-based hosts are started, moving to AMT. \n"

for amt_host in `cat amt_targs.txt`; 
	do 
	amtctrl $amt_host on
	sleep 1.5s
done

printf "All AMT-based hosts are started. \n"

exit 0
