#!/bin/bash
echo "s0meiyoshino v1.3 restore.sh"
echo "iPhone3,1 only"
echo "Select restore iOS version"
select iOSVer in iPhone3,1_6.0_10A403 iPhone3,1_6.0.1_10A523 iPhone3,1_6.1_10B144 iPhone3,1_6.1.2_10B146 iPhone3,1_6.1.3_10B329 iPhone3,1_7.0_11A465 iPhone3,1_7.0.2_11A501 iPhone3,1_7.0.3_11B511 iPhone3,1_7.0.4_11B554a iPhone3,1_7.0.6_11B651 iPhone3,1_7.1_11D169 iPhone3,1_7.1.1_11D201 exit
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

if [ "$iOSVer" = "iPhone3,1_7.0_11A465" ]; then
iOSVersion="7.0"
iOS_IPSW="iPhone3,1_7.0_11A465"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.0.2_11A501" ]; then
iOSVersion="7.0.2"
iOS_IPSW="iPhone3,1_7.0.2_11A501"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.0.3_11B511" ]; then
iOSVersion="7.0.3"
iOS_IPSW="iPhone3,1_7.0.3_11B511"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.0.4_11B554a" ]; then
iOSVersion="7.0.4"
iOS_IPSW="iPhone3,1_7.0.4_11B554a"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.0.6_11B651" ]; then
iOSVersion="7.0.6"
iOS_IPSW="iPhone3,1_7.0.6_11B651"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.1_11D169" ]; then
iOSVersion="7.1"
iOS_IPSW="iPhone3,1_7.1_11D169"
break
fi

if [ "$iOSVer" = "iPhone3,1_7.1.1_11D201" ]; then
iOSVersion="7.1.1"
iOS_IPSW="iPhone3,1_7.1.1_11D201"
break
fi

if [ "$iOSVer" = "exit" ]; then
exit
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
