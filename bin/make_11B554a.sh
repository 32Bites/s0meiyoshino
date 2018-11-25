#!/bin/bash
### Patching iBoot-1940.3.5~1
if [ -e "iPhone3,1_7.0.4_11B554a_Restore.ipsw" ]; then
echo "iPhone3,1_7.0.4_11B554a_Restore.ipsw exist"
else
echo "iPhone3,1_7.0.4_11B554a_Restore.ipsw does not exist"
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
mv `unzip -j ../iPhone3,1_7.0.4_11B554a_Restore.ipsw 'Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3' | awk '/inflating/{print $2}'` iBoot.n90ap.RELEASE.img3
../bin/xpwntool iBoot.n90ap.RELEASE.img3 iBoot.n90ap.11B554a.dec.img3 -k 2a6940252b5cb19b86efb9005cdd5fd713290e573dc760f5a3e05df9e868bb89 -iv 67087ac7f28c77cdf9110356f476540b -decrypt
../bin/xpwntool iBoot.n90ap.11B554a.dec.img3 iBoot.n90ap.11B554a.dec

### boot_partition_704.patch ###
## Bootpartition patch adrr: 0x5ff00a54
## 16 F0 5C F9 -> 00 20 00 20

echo "Inject BootArgs?"
select BootArgs in orig verbose
do

if [ "$BootArgs" = "orig" ]; then
../bin/iBoot32Patcher iBoot.n90ap.11B554a.dec PwnediBoot.n90ap.11B554a_1st.dec -r -d
echo "0000a54: 00200020" | xxd -r - PwnediBoot.n90ap.11B554a_1st.dec
break
fi

if [ "$BootArgs" = "verbose" ]; then
../bin/iBoot32Patcher iBoot.n90ap.11B554a.dec PwnediBoot.n90ap.11B554a_1st.dec -r -d -b "-v"
echo "0000a54: 00200020" | xxd -r - PwnediBoot.n90ap.11B554a_1st.dec
break
fi

done

../bin/xpwntool PwnediBoot.n90ap.11B554a_1st.dec PwnediBoot.n90ap.11B554a.img3 -t iBoot.n90ap.11B554a.dec.img3
echo "0000010: 63656269" | xxd -r - PwnediBoot.n90ap.11B554a.img3
echo "0000020: 63656269" | xxd -r - PwnediBoot.n90ap.11B554a.img3
mv -v PwnediBoot.n90ap.11B554a.img3 iBEC
tar -cvf bootloader.tar iBEC
cd ../
### Make custom ipsw by odysseus
./bin/ipsw iPhone3,1_7.0.4_11B554a_Restore.ipsw tmp_ipsw/iPhone3,1_7.0.4_11B554a_1st.ipsw -memory -ramdiskgrow 2000 tmp_ipsw/bootloader.tar

### Make CFW
cd tmp_ipsw
mkdir 11D257
unzip -d 11D257 ../iPhone3,1_7.1.2_11D257_Restore.ipsw
mkdir 11B554a
unzip -d 11B554a iPhone3,1_7.0.4_11B554a_1st.ipsw

rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
rm 11B554a/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3

mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3 11B554a/Firmware/all_flash/all_flash.n90ap.production/

## make ramdisk
umount /Volumes/ramdisk
../bin/xpwntool 11B554a/058-1056-002.dmg 11B554a/ramdisk.dmg
MountRamdisk="$((hdiutil mount 11B554a/ramdisk.dmg) | sed -n -e 's/^.* //p')"
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

mv -v $MountRamdisk/usr/share/progressui/applelogo@2x.tga $MountRamdisk/usr/share/progressui/applelogo_orig.tga
bspatch $MountRamdisk/usr/share/progressui/applelogo_orig.tga $MountRamdisk/usr/share/progressui/applelogo@2x.tga ../patch/applelogo7.patch
sleep 1s

umount $MountRamdisk
sleep 1s

mv 11B554a/058-1056-002.dmg 11B554a/t.dmg
../bin/xpwntool 11B554a/ramdisk.dmg 11B554a/058-1056-002.dmg -t 11B554a/t.dmg
rm 11B554a/ramdisk.dmg
rm 11B554a/t.dmg
rm -r 11D257

## zipping ipsw
cd 11B554a
zip ../../iPhone3,1_7.0.4_11B554a_Custom.ipsw -r *

## clean up
cd ../../
rm -r tmp_ipsw
