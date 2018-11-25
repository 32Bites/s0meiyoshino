#!/bin/bash
echo "s0meiyoshino v1.2"
echo "##iPhone3,1 only##"
echo "Select iOS Version"
select iOSVer in iPhone3,1_6.1.2_10B146 iPhone3,1_6.1.3_10B329 iPhone3,1_7.0.4_11B554a exit
do

if [ "$iOSVer" = "iPhone3,1_6.1.2_10B146" ]; then
./bin/restore_10B146.sh
break
fi

if [ "$iOSVer" = "iPhone3,1_6.1.3_10B329" ]; then
./bin/restore_10B329.sh
break
fi

if [ "$iOSVer" = "iPhone3,1_7.0.4_11B554a" ]; then
./bin/restore_11B554a.sh
break
fi

if [ "$iOSVer" = "exit" ]; then
break
fi

done