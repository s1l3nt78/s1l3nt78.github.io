#!/usr/bin/env bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

SHODAN-API='<shodan-api-key>'

listing(){
    echo -e "${YLW}"
    cat files/pingtest.pass
    echo -e "${NC}"
}

if [[ -d /opt/sifter/results/xRay ]]; then
    echo ""
else
    mkdir /opt/sifter/results/xRay
fi
echo -e "${RED}"
figlet -f mini "xRay"
echo -e "${NC}"
cd /opt/xray 
listing
echo -e "${W}Please enter your target${NC}"
read TARGET
sudo docker run --rm -it -p 8080:8080 xraydocker xray -address 0.0.0.0 -shodan-key ${SHODAN-API} -domain ${TARGET}
echo -e "${W}When done please press enter${NC}"
read RANDOM
cd /opt/sifter
./sifter -m
