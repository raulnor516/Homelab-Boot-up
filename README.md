# Homelab-Boot-up

Goal is having a single program or script that can be run, that will boot up all selected IPMI and AMT-based servers at the same time.

CURRENT STATUS:
 - Credential collection working
 - IPMItool support working
 - AMT support completed
 - Error handling mostly broken

TODO:
 - Reword script to follow functional programming tenents
 - Look at feasability of providing "nice" shutdown functionality
 - Figure out why getopts ? and : options aren't working properly
 
ASSUMPTIONS:
 - IPMI and AMT are already set up for LAN access (AMT username has to be "admin")
 - All servers use the same username and password for authentication
 - Either IP addresses or hostnames are routable from your launch point
 
SETUP:

IPMI
 - Install ipmitool
 - wget https://raw.githubusercontent.com/raulnor516/Homelab-Boot-up/master/siege_launch.sh
 - make a file called "ipmi_targs.txt" in the same directory as siege_launch.sh
 - Add one IP address or hostname per line for each IPMI-enabled server you want to start
 
 AMT
 - git clone https://github.com/sdague/amt
 - install python pip if not already installed https://pip.pypa.io/en/stable/installing/
 - run "pip install -U pip setuptools"
 - pip install amt
 - For each server using amt, run the following command:
     "amtctrl add 'servername' 'ipaddress' 'password'"
 - create a text file named "amt_targs.txt" and enter one server name per line that you added in the previous step
 - call siege_launch.sh -u [username] -p [password]
 
 This is my first ever programming project, but i hope someone finds it useful!
