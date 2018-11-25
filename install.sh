#!/bin/bash
if [ -e "odysseus" ]; then
echo "Odysseus already exist"
else
wget https://dayt0n.github.io/odysseus/odysseus-0.999.zip
unzip -d ./ odysseus-0.999.zip
mv -v odysseus-0.999.0 odysseus
rm odysseus-0.999.zip
rm -r __MACOSX

mkdir FirmwareBundles
mkdir shsh

cp -a odysseus/macos/FirmwareBundles/Down_iPhone3,1_6.1.3_10B329.bundle FirmwareBundles/
cp -a odysseus/macos/idevicerestore ./
cp -a odysseus/macos/ipsw ./
cp -a odysseus/macos/xpwntool ./
fi

if [ -e "iloader" ]; then
echo "iloader already exist"
else
git clone https://github.com/dora2-iOS/iloader.git
cp -a iloader/iPhone3,1/11D257/ramdiskH_beta4.dmg ./
mv -v ramdiskH_beta4.dmg ramdiskH.dmg
fi

if [ -e "ipwndfu" ]; then
echo "ipwndfu already exist"
else
git clone https://github.com/axi0mX/ipwndfu.git
fi

echo "Done!"
