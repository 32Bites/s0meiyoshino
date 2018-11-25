#!/bin/bash
### Patching iBoot-1537.9.55~4
if [ -e "iPhone3,1_6.1.2_10B146_Restore.ipsw" ]; then
echo "iPhone3,1_6.1.2_10B146_Restore.ipsw exist"
else
echo "iPhone3,1_6.1.2_10B146_Restore.ipsw does not exist"
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
mv `unzip -j ../iPhone3,1_6.1.2_10B146_Restore.ipsw 'Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3' | awk '/inflating/{print $2}'` iBoot.n90ap.RELEASE.img3
../bin/xpwntool iBoot.n90ap.RELEASE.img3 iBoot.n90ap.10B146.dec.img3 -k cbcd007712618cb6ab3be147f0317e22e7cceadb344e99ea1a076ef235c2c534 -iv c939629e3473fdb67deae0c45582506d -decrypt
../bin/xpwntool iBoot.n90ap.10B146.dec.img3 iBoot.n90ap.10B146.dec

### boot_partition_6.patch ###
## Bootpartition patch adrr: 0x5ff00a6c
## 16 F0 BA FB -> 00 20 00 20

echo "Inject BootArgs?"
select BootArgs in orig verbose
do

if [ "$BootArgs" = "orig" ]; then
../bin/iBoot32Patcher iBoot.n90ap.10B146.dec PwnediBoot.n90ap.10B146_1st.dec -r -d
echo "0000a6c: 00200020" | xxd -r - PwnediBoot.n90ap.10B146_1st.dec
break
fi

if [ "$BootArgs" = "verbose" ]; then
../bin/iBoot32Patcher iBoot.n90ap.10B146.dec PwnediBoot.n90ap.10B146_1st.dec -r -d -b "-v"
echo "0000a6c: 00200020" | xxd -r - PwnediBoot.n90ap.10B146_1st.dec
break
fi

done

../bin/xpwntool PwnediBoot.n90ap.10B146_1st.dec PwnediBoot.n90ap.10B146.img3 -t iBoot.n90ap.10B146.dec.img3
echo "0000010: 63656269" | xxd -r - PwnediBoot.n90ap.10B146.img3
echo "0000020: 63656269" | xxd -r - PwnediBoot.n90ap.10B146.img3
mv -v PwnediBoot.n90ap.10B146.img3 iBEC
tar -cvf bootloader.tar iBEC
cd ../
### Make custom ipsw by odysseus
./bin/ipsw iPhone3,1_6.1.2_10B146_Restore.ipsw tmp_ipsw/iPhone3,1_6.1.2_10B146_1st.ipsw -memory -ramdiskgrow 2000 tmp_ipsw/bootloader.tar

### Make CFW
cd tmp_ipsw
mkdir 11D257
unzip -d 11D257 ../iPhone3,1_7.1.2_11D257_Restore.ipsw
mkdir 10B146
unzip -d 10B146 iPhone3,1_6.1.2_10B146_1st.ipsw

rm 10B146/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x.s5l8930x.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
rm 10B146/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone.s5l8930x.img3

mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3 10B146/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone.s5l8930x.img3

## make ramdisk
umount /Volumes/ramdisk
../bin/xpwntool 10B146/048-1037-002.dmg 10B146/ramdisk.dmg
MountRamdisk="$((hdiutil mount 10B146/ramdisk.dmg) | sed -n -e 's/^.* //p')"
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
cp -a -v ../src/ramdiskH.dmg $MountRamdisk/

mv -v $MountRamdisk/usr/share/progressui/images-2x/applelogo.png $MountRamdisk/usr/share/progressui/images-2x/applelogo_orig.png
bspatch $MountRamdisk/usr/share/progressui/images-2x/applelogo_orig.png $MountRamdisk/usr/share/progressui/images-2x/applelogo.png ../patch/applelogo.patch
sleep 1s

umount $MountRamdisk
sleep 1s

mv 10B146/048-1037-002.dmg 10B146/t.dmg
../bin/xpwntool 10B146/ramdisk.dmg 10B146/048-1037-002.dmg -t 10B146/t.dmg
rm 10B146/ramdisk.dmg
rm 10B146/t.dmg
rm -r 11D257

## zipping ipsw
cd 10B146
zip ../../iPhone3,1_6.1.2_10B146_Custom.ipsw -r *

## clean up
cd ../../
rm -r tmp_ipsw
