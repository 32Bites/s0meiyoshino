#!/bin/bash
echo "s0meiyoshino v1.2.1"
echo "iPhone3,1 only"
echo "Select iOS Version"
select iOSVer in iPhone3,1_6.0_10A403 iPhone3,1_6.0.1_10A523 iPhone3,1_6.1_10B144 iPhone3,1_6.1.2_10B146 iPhone3,1_6.1.3_10B329 iPhone3,1_7.0.4_11B554a exit
do

## if [ "$iOSVer" = "iPhone3,1_5.1.1_9B208" ]; then
## iOSVersion="5.1.1"
## iOS_IPSW="iPhone3,1_5.1.1_9B208"
## break
## fi

if [ "$iOSVer" = "iPhone3,1_6.0_10A403" ]; then
iOSVersion="6.0"
iOS_IPSW="iPhone3,1_6.0_10A403"
break
fi

if [ "$iOSVer" = "iPhone3,1_6.0.1_10A523" ]; then
iOSVersion="6.0.1"
iOS_IPSW="iPhone3,1_6.0.1_10A523"
break
fi

if [ "$iOSVer" = "iPhone3,1_6.1_10B144" ]; then
iOSVersion="6.1"
iOS_IPSW="iPhone3,1_6.1_10B144"
break
fi

if [ "$iOSVer" = "iPhone3,1_6.1.2_10B146" ]; then
iOSVersion="6.1.2"
iOS_IPSW="iPhone3,1_6.1.2_10B146"
break
fi

if [ "$iOSVer" = "iPhone3,1_6.1.3_10B329" ]; then
iOSVersion="6.1.3"
iOS_IPSW="iPhone3,1_6.1.3_10B329"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.0.4_11B554a" ]; then
iOSVersion="7.0.4"
iOS_IPSW="iPhone3,1_7.0.4_11B554a"
break
fi

if [ "$iOSVer" = "exit" ]; then
break
fi

done

cd ipwndfu
./ipwndfu -p
cd ../

### get shsh
if [ -e "iPhone3,1_7.1.2_11D257_Restore.ipsw" ]; then
echo "getting shsh..."
ECID="$((./bin/idevicerestore -t iPhone3,1_7.1.2_11D257_Restore.ipsw) | sed -n -e 's/^.*Found ECID //p')"
mv -v shsh/$ECID-iPhone3,1-7.1.2.shsh shsh/$ECID-iPhone3,1-$iOSVersion.shsh
else
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw does not exist"
fi

### Restore
./bin/idevicerestore -e -w "$iOS_IPSW"_Custom.ipsw
echo "Done!"
