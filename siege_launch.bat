#!/bin/bash

uflag=
pflag=

if (($# == 0));
    then printf "No options given, use [-u username] and [-p password]. /n" >&2
    exit 2
fi

while getopts ':u:p:' CRED
do
    case $CRED in
        u) uflag=1
            username="$OPTARG"
            ;;
        p) pflag=1
            password="$OPTARG"
            ;;
        /?) printf "Bad switch given. Use [-u username] and [-p password]. \n" $(basename $0) >&2
        #So that last line just gives some error handling if bad switches are given.
        #The basename $0 thing is supposed to return the name of the script that errored, to stderror
            exit 2
            ;;
        /:) printf "You need to supply credentials after each -u or -p. \n" >&2
        # If someone provides a -u or -p without text after it, this will tell them to add info
            exit 2
            ;;
    esac
done
shift $(($OPTIND -1))

if [ "${uflag}${pflag}" ]
    then printf "Passing username '$username' and password '$password' to ipmitool and amt. \n"
fi
exit 0
