#!/bin/bash
cd ~/servers/pihole/auto-adlist/
rm ./merged.txt
declare -a lists=(
"https://blocklistproject.github.io/Lists/ads.txt" 
"https://blocklistproject.github.io/Lists/phishing.txt" 
"https://blocklistproject.github.io/Lists/scam.txt" 
"https://blocklistproject.github.io/Lists/tracking.txt" 
"https://blocklistproject.github.io/Lists/abuse.txt"
"https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt"
"https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt"
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/add.2o7Net/hosts"
"https://v.firebog.net/hosts/Prigent-Ads.txt"
"https://v.firebog.net/hosts/Easyprivacy.txt"
"https://raw.githubusercontent.com/bigdargon/hostsVN/master/hosts"
"https://raw.githubusercontent.com/FadeMind/hosts.extras/master/UncheckyAds/hosts"
"https://pgl.yoyo.org/adservers/serverlist.php?hostformat=hosts&showintro=0&mimetype=plaintext"
"https://v.firebog.net/hosts/Easylist.txt"
"https://raw.githubusercontent.com/anudeepND/blacklist/master/adservers.txt"
"https://v.firebog.net/hosts/Admiral.txt"
"https://v.firebog.net/hosts/AdguardDNS.txt"
"https://adaway.org/hosts.txt"
"https://raw.githubusercontent.com/Perflyst/PiHoleBlocklist/master/SmartTV.txt"
)

for list in "${lists[@]}"
do
	curl --fail $list >> merged.txt
	printf "\n\n########################################\n\n" >> merged.txt

done

if [ ! -f "./merged.txt" ]; then
	echo "0.0.0.0" > merged.txt
fi

git add *
git pull
git commit -m "automatic update"
git push
