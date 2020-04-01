#!/bin/bash
RED='\033[0;31m'
NC='\033[0m'
ORNG='\033[0;33m'
W='\033[1;37m'
YLW='\033[1;33m'
LBBLUE='\e[104m'

if [[ -d /opt/sifter/results/WPScan ]]; then
    echo ""
else
    mkdir /opt/sifter/results/WPScan
fi
echo -e "${ORNG}WPscan${NC}"
echo -e "${ORNG}*******${NC}"
echo -e "${YLW}"
cat files/pingtest.pass
echo -e "${NC}"
echo -e "${W}Please copy and paste in your target site${NC}"
read TARGET
echo "==================================================================================="
sudo wpscan --url http://${TARGET} --wp-content-dir wp-content -e u vp vt dbe --random-user-agent | tee /opt/sifter/results/WPScan/${TARGET}.txt
LOG=$(cat /opt/sifter/results/WPScan/${TARGET}.txt | grep "ignore-main-redirect")
if [[ ${LOG} == "ignore-main-redirect" ]]; then
	sudo wpscan --url https://${TARGET} --wp-content-dir wp-content -e u vp vt dbe --random-user-agent | tee /opt/sifter/results/WPScan/${TARGET}.txt
fi
echo "==================================================================================="
sleep 2

	echo -e "${W}Would you like WPScan to search for passwords of enumerated users (if any)${NC}"
	options=("Yes" "No")
	select opts in "${options[@]}"
	do
		case $opts in
			"Yes")
				echo "==================================================================================="
				echo -e "${W}Please enter the full /path/to/wordlist.txt${NC}"
			       	sleep 2
			        read WORDLIST
			        sleep 2
				if [[ ${LOG} == "ignore-main-redirect" ]]; then
					sudo wpscan --url https://${TARGET} --wp-content-dir wp-content -e u -P ${WORDLIST} --random-user-agent | tee /opt/sifter/results/WPScan/${TARGET}.txt
<<<<<<< Updated upstream
			        else
=======
				else
>>>>>>> Stashed changes
					sudo wpscan --url http://${TARGET} --wp-content-dir wp-content -e u -P ${WORDLIST} --random-user-agent | tee /opt/sifter/results/WPScan/${TARGET}.txt
				fi
				echo "==================================================================================="
				sleep 1
				cd /opt/sifter
				sifter -m
				;;

			"No")
				cd /opt/sifter
				sifter -m
				;;

		esac
	done
