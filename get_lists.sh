#!/bin/bash
cd ~/servers/pihole/pihole-adlist-merged/
rm ./merged.txt
declare -a lists=(
"https://blocklistproject.github.io/Lists/ads.txt" 
"https://blocklistproject.github.io/Lists/phishing.txt" 
"https://blocklistproject.github.io/Lists/scam.txt" 
"https://blocklistproject.github.io/Lists/tracking.txt" 
"https://blocklistproject.github.io/Lists/abuse.txt"
)

for list in "${lists[@]}"
do
	curl --fail $list >> merged.txt
done

if [ ! -f "./merged.txt" ]; then
	echo "0.0.0.0" > merged.txt
fi

git add *
git pull
git commit -m "daily automatic update"
git push
