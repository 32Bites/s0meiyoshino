#!/bin/bash
### Enter Pwned DFU mode
cd ipwndfu
./ipwndfu -p
cd ../

### get shsh
if [ -e "iPhone3,1_7.1.2_11D257_Restore.ipsw" ]; then
echo "getting shsh..."
ECID="$((./idevicerestore -t iPhone3,1_7.1.2_11D257_Restore.ipsw) | sed -n -e 's/^.*Found ECID //p')"
mv -v shsh/$ECID-iPhone3,1-7.1.2.shsh shsh/$ECID-iPhone3,1-6.1.3.shsh
else
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw does not exist"
fi

### Restore
./idevicerestore -e -w iPhone3,1_6.1.3_10B329_Custom.ipsw
echo "exploiting..."
sleep 10s
echo "Done!"