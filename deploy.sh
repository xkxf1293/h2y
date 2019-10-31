#!/bin/bash

git remote add upstream "https://${geo_token}@github.com/ToutyRater/V2Ray-SiteDAT.git"

mkdir -p h2y
cd h2y
rm -rf ./*

wget https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/sr_direct_banad.conf
cat sr_direct_banad.conf | grep Reject | grep DOMAIN-SUFFIX | awk -F, '{print $2}' | awk '{sub("^\.*","");print}' > ad
#cat sr_direct_banad.conf | grep Reject|grep CIDR|awk -F, '{print $2}' > ad_ip
rm -rf ./sr_direct_banad.conf
#ls -al

#wget https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/factory/resultant/ad.list
#cat ad.list > ad

wget https://raw.githubusercontent.com/h2y/Shadowrocket-ADBlock-Rules/master/factory/resultant/gfw.list
cat gfw.list > gfw

rm -rf *.list

cd ..
mkdir -p geofiles
ls -al
chmod +x ./v2sitedat
./v2sitedat -dat ./geofiles/h2y.dat -dir ./h2y


#git checkout -b master
git add -A
git commit -m 'Update'
git push -u upstream HEAD:master 
