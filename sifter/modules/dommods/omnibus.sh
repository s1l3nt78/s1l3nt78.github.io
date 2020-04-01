#!/bin/bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'
RED='\033[0;31m'

cd /opt/omnibus
echo -e "${ORNG}"
figlet -f mini "Omnibus"
echo -e "${NC}"
sudo python omnibus-cli.py
sleep 2
echo -e "${W}======================================================${NC}"
sleep 2
cd /opt/sifter
sifter -m