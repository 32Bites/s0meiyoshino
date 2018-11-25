#!/bin/bash
### Patching iBoot_10B329
if [ -e "iPhone3,1_6.1.3_10B329_Restore.ipsw" ]; then
echo "iPhone3,1_6.1.3_10B329_Restore.ipsw exist"
else
echo "iPhone3,1_6.1.3_10B329_Restore.ipsw does not exist"
exit
fi
if [ -e "iPhone3,1_7.1.2_11D257_Restore.ipsw" ]; then
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw exist"
else
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw does not exist"
exit
fi

rm -r tmp_ipsw
mkdir tmp_ipsw
cd tmp_ipsw
mv `unzip -j ../iPhone3,1_6.1.3_10B329_Restore.ipsw 'Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3' | awk '/inflating/{print $2}'` iBoot.n90ap.RELEASE.img3
../xpwntool iBoot.n90ap.RELEASE.img3 iBoot.n90ap.10B329.dec.img3 -k 3dbe8be17af793b043eed7af865f0b843936659550ad692db96865c00171959f -iv b559a2c7dae9b95643c6610b4cf26dbd -decrypt
../xpwntool iBoot.n90ap.10B329.dec.img3 iBoot.n90ap.10B329.dec

echo "Inject BootArgs?"
select BootArgs in orig verbose
do
if [ "$BootArgs" = "orig" ]; then
bspatch iBoot.n90ap.10B329.dec PwnediBoot.n90ap.10B329.dec ../patch/iBoot.patch
break
fi

if [ "$BootArgs" = "verbose" ]; then
bspatch iBoot.n90ap.10B329.dec PwnediBoot.n90ap.10B329.dec ../patch/iBoot_v.patch
break
fi

done

##bspatch iBoot.n90ap.10B329.dec PwnediBoot.n90ap.10B329.dec ../patch/iBoot.patch
../xpwntool PwnediBoot.n90ap.10B329.dec PwnediBoot.n90ap.10B329.img3 -t iBoot.n90ap.10B329.dec.img3
bspatch PwnediBoot.n90ap.10B329.img3 PwnediBEC.n90ap.10B329.img3 ../patch/ibot_tag.patch
mv -v PwnediBEC.n90ap.10B329.img3 iBEC
tar -cvf bootloader.tar iBEC
cd ../
### Make custom ipsw by odysseus
./ipsw iPhone3,1_6.1.3_10B329_Restore.ipsw tmp_ipsw/iPhone3,1_6.1.3_10B329_1st.ipsw -memory -ramdiskgrow 2000 tmp_ipsw/bootloader.tar

### Make CFW
cd tmp_ipsw
mkdir 11D257
unzip -d 11D257 ../iPhone3,1_7.1.2_11D257_Restore.ipsw
mkdir 10B329
unzip -d 10B329 iPhone3,1_6.1.3_10B329_1st.ipsw

rm 10B329/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x.s5l8930x.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
rm 10B329/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone.s5l8930x.img3

mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3 10B329/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone.s5l8930x.img3

## make ramdisk
umount /Volumes/ramdisk
../xpwntool 10B329/048-2441-007.dmg 10B329/048-2441-007_.dmg
MountRamdisk="$((hdiutil mount 10B329/048-2441-007_.dmg) | sed -n -e 's/^.* //p')"
sleep 1s

tar -xvf ../src/bin.tar -C $MountRamdisk/ --preserve-permissions
mv -v $MountRamdisk/sbin/reboot $MountRamdisk/sbin/reboot_
cp -a -v ../src/partition.sh $MountRamdisk/sbin/reboot

chmod 755 $MountRamdisk/bin/bash
chmod 755 $MountRamdisk/bin/dd
chmod 755 $MountRamdisk/bin/echo
chmod 755 $MountRamdisk/bin/sleep
chmod 755 $MountRamdisk/usr/bin/gptfdisk
chmod 755 $MountRamdisk/usr/bin/hfs_resize
chmod 755 $MountRamdisk/sbin/reboot
cp -a -v ../ramdiskH.dmg $MountRamdisk/

mv -v $MountRamdisk/usr/share/progressui/images-2x/applelogo.png $MountRamdisk/usr/share/progressui/images-2x/applelogo_orig.png
bspatch $MountRamdisk/usr/share/progressui/images-2x/applelogo_orig.png $MountRamdisk/usr/share/progressui/images-2x/applelogo.png ../patch/applelogo.patch
sleep 1s

umount $MountRamdisk
sleep 1s

mv 10B329/048-2441-007.dmg 10B329/t.dmg
../xpwntool 10B329/048-2441-007_.dmg 10B329/048-2441-007.dmg -t 10B329/t.dmg
rm 10B329/048-2441-007_.dmg
rm 10B329/t.dmg
rm -r 11D257

## zipping ipsw
cd 10B329
zip ../../iPhone3,1_6.1.3_10B329_Custom.ipsw -r *

## clean up
cd ../../
rm -r tmp_ipsw
