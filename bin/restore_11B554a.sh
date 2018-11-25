#!/bin/bash
### Enter Pwned DFU mode
cd ipwndfu
./ipwndfu -p
cd ../

### get shsh
if [ -e "iPhone3,1_7.1.2_11D257_Restore.ipsw" ]; then
echo "getting shsh..."
ECID="$((./bin/idevicerestore -t iPhone3,1_7.1.2_11D257_Restore.ipsw) | sed -n -e 's/^.*Found ECID //p')"
mv -v shsh/$ECID-iPhone3,1-7.1.2.shsh shsh/$ECID-iPhone3,1-7.0.4.shsh
else
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw does not exist"
fi

### Restore
./bin/idevicerestore -e -w iPhone3,1_7.0.4_11B554a_Custom.ipsw
echo "Done!"
