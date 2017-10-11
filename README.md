# Homelab-Boot-up

Goal is having a single program or script that can be run, that will boot up all selected IPMI and AMT-based servers at the same time.

CURRENT STATUS:
 - Credential collection working
 - IPMItool support working
 - AMT support in progress

TODO:
 - Complete AMT functionality
 - Reword script to follow functional programming tenents
 - Look at feasability of providing "nice" shutdown functionality
 
SETUP:
 - Install ipmitool
 - wget https://raw.githubusercontent.com/raulnor516/master/siege_launch.bat
 - make a file called "ipmi_targs.txt" in the same directory as siege_launch.bat
 - Add one IP address or hostname per line for each IPMI-enabled server you want to start
 - call siege_launch.bat -u [username] -p [password]
 
 This is my first ever programming project, but i hope someone finds it useful!
