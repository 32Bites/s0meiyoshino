#!/bin/bash
echo "s0meiyoshino v1.2.1"
echo "iPhone3,1 only"
echo "Select iOS Version"

select iOSVer in "iOS 6" "iOS 7" exit
do
## if [ "$iOSVer" = "iOS 5" ]; then
## iOSLIST="6"
## echo "Select iOS 5.x"
## select iOSVers in "iOS 5.1.1r"
## do
## if [ "$iOSVers" = "iOS 5.1.1r" ]; then
## ### Patching iBoot-1219.62.15~2
## iOSVersion="5.1.1_9B208"
## iOSBuild="9B208"
## RestoreRamdisk="038-5512-003.dmg"
## iBoot_Key="6377d34deddf26c9b464f927f18b222be75f1b5547e537742e7dfca305660fea"
## iBoot_IV="71fe96da25812ff341181ba43546ea4f"
## Boot_Partition_Patch="000081a: 00200020"
## break
## fi
## done
## break
## fi
if [ "$iOSVer" = "iOS 6" ]; then
iOSLIST="6"
echo "Select iOS 6.x"
select iOSVers in "iOS 6.0" "iOS 6.0.1" "iOS 6.1" "iOS 6.1.2" "iOS 6.1.3"
do
if [ "$iOSVers" = "iOS 6.0" ]; then
### Patching iBoot-1537.4.18~2
iOSVersion="6.0_10A403"
iOSBuild="10A403"
RestoreRamdisk="038-6451-001.dmg"
iBoot_Key="838270f668a05a60ff352d8549c06d2f21c3e4f7617c72a78d82c92a3ad3a045"
iBoot_IV="7891928b9dd0dd919778743a2c8ec6b3"
Boot_Partition_Patch="0000a6c: 00200020"
break
fi
if [ "$iOSVers" = "iOS 6.0.1" ]; then
### Patching iBoot-1537.4.21~3
iOSVersion="6.0.1_10A523"
iOSBuild="10A523"
RestoreRamdisk="038-7924-011.dmg"
iBoot_Key="8d539232c0e906a9f60caa462f189530f745c4abd81a742b4d1ec1cb8b9ca6c3"
iBoot_IV="44ffe675d6f31167369787a17725d06c"
Boot_Partition_Patch="0000a6c: 00200020"
break
fi
if [ "$iOSVers" = "iOS 6.1" ]; then
### Patching iBoot-1537.9.55~4
iOSVersion="6.1_10B144"
iOSBuild="10B144"
RestoreRamdisk="048-0804-001.dmg"
iBoot_Key="891ed50315763dac51434daeb8543b5975a555fb8388cc578d0f421f833da04d"
iBoot_IV="4d76b7e25893839cfca478b44ddef3dd"
Boot_Partition_Patch="0000a6c: 00200020"
break
fi
if [ "$iOSVers" = "iOS 6.1.2" ]; then
### Patching iBoot-1537.9.55~4
iOSVersion="6.1.2_10B146"
iOSBuild="10B146"
RestoreRamdisk="048-1037-002.dmg"
iBoot_Key="cbcd007712618cb6ab3be147f0317e22e7cceadb344e99ea1a076ef235c2c534"
iBoot_IV="c939629e3473fdb67deae0c45582506d"
Boot_Partition_Patch="0000a6c: 00200020"
break
fi
if [ "$iOSVers" = "iOS 6.1.3" ]; then
### Patching iBoot-1537.9.55~11
iOSVersion="6.1.3_10B329"
iOSBuild="10B329"
RestoreRamdisk="048-2441-007.dmg"
iBoot_Key="3dbe8be17af793b043eed7af865f0b843936659550ad692db96865c00171959f"
iBoot_IV="b559a2c7dae9b95643c6610b4cf26dbd"
Boot_Partition_Patch="0000a6c: 00200020"
break
fi
done
break
fi
if [ "$iOSVer" = "iOS 7" ]; then
iOSLIST="7"
echo "Select iOS 7.x"
select iOSVers in "iOS 7.0" "iOS 7.0.2" "iOS 7.0.3" "iOS 7.0.4" "iOS 7.0.6" "iOS 7.1" "iOS 7.1.1"
do
if [ "$iOSVers" = "iOS 7.0" ]; then
### Patching iBoot-1940.1.75~20
iOSVersion="7.0_11A465"
iOSBuild="11A465"
RestoreRamdisk="038-3373-256.dmg"
iBoot_Key="e1fef31c8aabcdca2a3887ba21c0e2113c41a5617380657ab6a487993b39f9a8"
iBoot_IV="5bf099d9db5cf1009329e527a378c8be"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
if [ "$iOSVers" = "iOS 7.0.2" ]; then
### Patching iBoot-1940.1.75~93
iOSVersion="7.0.2_11A501"
iOSBuild="11A501"
RestoreRamdisk="048-9414-002.dmg"
iBoot_Key="5cd910c268813cb4008e5b33e01f761c0794ed1437737b4d386727d17fac79d1"
iBoot_IV="65db9a4e4f64bb79a55d76d98ce1457b"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
if [ "$iOSVers" = "iOS 7.0.3" ]; then
### Patching iBoot-1940.3.5~1
iOSVersion="7.0.3_11B511"
iOSBuild="11B511"
RestoreRamdisk="058-0322-002.dmg"
iBoot_Key="bd56f0886e21f233f519d4db20fd044b9208882a6fb791553a75eb4e0c45bbc5"
iBoot_IV="7cb97df787dcc6367816b03492b225f9"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
if [ "$iOSVers" = "iOS 7.0.4" ]; then
### Patching iBoot-1940.3.5~1
iOSVersion="7.0.4_11B554a"
iOSBuild="11B554a"
RestoreRamdisk="058-1056-002.dmg"
iBoot_Key="2a6940252b5cb19b86efb9005cdd5fd713290e573dc760f5a3e05df9e868bb89"
iBoot_IV="67087ac7f28c77cdf9110356f476540b"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
if [ "$iOSVers" = "iOS 7.0.6" ]; then
### Patching iBoot-1940.3.5~1
iOSVersion="7.0.6_11B651"
iOSBuild="11B651"
RestoreRamdisk="058-2320-001.dmg"
iBoot_Key="d7b5bb9b90f19493449ab17fda63afdb16069ad5b65026bb11b4db223fdd4be1"
iBoot_IV="12af3a975f0346e89d3a34e73b4e0ae1"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
if [ "$iOSVers" = "iOS 7.1" ]; then
### Patching iBoot-1940.10.58~115
iOSVersion="7.1_11D169"
iOSBuild="11D169"
RestoreRamdisk="058-4107-003.dmg"
iBoot_Key="b68612f21e377bd1f685e9031be159a724e931eff162db245c63b7b692cefa7e"
iBoot_IV="9fe5b6785126c8fc5787582df9efcf94"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
if [ "$iOSVers" = "iOS 7.1.1" ]; then
### Patching iBoot-1940.10.58~122
iOSVersion="7.1.1_11D201"
iOSBuild="11D201"
RestoreRamdisk="058-00093-002.dmg"
iBoot_Key="c6fbf428e0105ab22b2abaefd20ca22c2084e200f74e8a3b08298a54f8bfe28f"
iBoot_IV="b110991061d76f74c1fc05ddd7cff540"
Boot_Partition_Patch="0000a54: 00200020"
break
fi
done
break
fi
if [ "$iOSVer" = "exit" ]; then
exit
fi
done

if [ -e "iPhone3,1_"$iOSVersion"_Restore.ipsw" ]; then
echo "iPhone3,1_"$iOSVersion"_Restore.ipsw OK"
else
echo "iPhone3,1_"$iOSVersion"_Restore.ipsw does not exist"
exit
fi

if [ -e "iPhone3,1_7.1.2_11D257_Restore.ipsw" ]; then
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw OK"
else
echo "iPhone3,1_7.1.2_11D257_Restore.ipsw does not exist"
exit
fi

if [ -d "tmp_ipsw" ]; then
rm -r tmp_ipsw
fi

mkdir tmp_ipsw
cd tmp_ipsw
mv `unzip -j ../iPhone3,1_"$iOSVersion"_Restore.ipsw 'Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3' | awk '/inflating/{print $2}'` iBoot.n90ap.RELEASE.img3
../bin/xpwntool iBoot.n90ap.RELEASE.img3 iBoot.n90ap.dec.img3 -k $iBoot_Key -iv $iBoot_IV -decrypt
../bin/xpwntool iBoot.n90ap.dec.img3 iBoot.n90ap.dec

echo "Inject BootArgs?"
select BootArgs in orig verbose
do
if [ "$BootArgs" = "orig" ]; then
../bin/iBoot32Patcher iBoot.n90ap.dec PwnediBoot.n90ap.dec -r -d
break
fi
if [ "$BootArgs" = "verbose" ]; then
../bin/iBoot32Patcher iBoot.n90ap.dec PwnediBoot.n90ap.dec -r -d -b "-v"
break
fi
done

echo "$Boot_Partition_Patch" | xxd -r - PwnediBoot.n90ap.dec
../bin/xpwntool PwnediBoot.n90ap.dec PwnediBoot.n90ap.img3 -t iBoot.n90ap.dec.img3
echo "0000010: 63656269" | xxd -r - PwnediBoot.n90ap.img3
echo "0000020: 63656269" | xxd -r - PwnediBoot.n90ap.img3
mv -v PwnediBoot.n90ap.img3 iBEC
tar -cvf bootloader.tar iBEC
cd ../
### Make custom ipsw by odysseus
./bin/ipsw iPhone3,1_"$iOSVersion"_Restore.ipsw tmp_ipsw/iPhone3,1_"$iOSVersion"_Odysseus.ipsw -memory -ramdiskgrow 2000 tmp_ipsw/bootloader.tar

### Make CFW
cd tmp_ipsw
mkdir 11D257
unzip -d 11D257 ../iPhone3,1_7.1.2_11D257_Restore.ipsw
mkdir $iOSBuild
unzip -d $iOSBuild iPhone3,1_"$iOSVersion"_Odysseus.ipsw

if [ "$iOSLIST" = "6" ]; then
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone.s5l8930x.img3
fi

if [ "$iOSLIST" = "7" ]; then
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3
rm $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/applelogo@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging0@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterycharging1@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batteryfull@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow0@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/batterylow1@2x~iphone.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/glyphplugin@2x~iphone-30pin.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/iBoot.n90ap.RELEASE.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/LLB.n90ap.RELEASE.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
mv -v 11D257/Firmware/all_flash/all_flash.n90ap.production/recoverymode@2x~iphone-30pin.s5l8930x.img3 $iOSBuild/Firmware/all_flash/all_flash.n90ap.production/
fi

## make ramdisk
umount /Volumes/ramdisk
../bin/xpwntool $iOSBuild/$RestoreRamdisk $iOSBuild/ramdisk.dmg
MountRamdisk="$((hdiutil mount $iOSBuild/ramdisk.dmg) | sed -n -e 's/^.* //p')"
sleep 1s

tar -xvf ../src/bin.tar -C $MountRamdisk/ --preserve-permissions
mv -v $MountRamdisk/sbin/reboot $MountRamdisk/sbin/reboot_
cp -a -v ../src/partition.sh $MountRamdisk/sbin/reboot
cp -a -v ../src/ramdiskH.dmg $MountRamdisk/
chmod 755 $MountRamdisk/sbin/reboot

if [ "$iOSLIST" = "6" ]; then
mv -v $MountRamdisk/usr/share/progressui/images-2x/applelogo.png $MountRamdisk/usr/share/progressui/images-2x/applelogo_orig.png
bspatch $MountRamdisk/usr/share/progressui/images-2x/applelogo_orig.png $MountRamdisk/usr/share/progressui/images-2x/applelogo.png ../patch/applelogo.patch
fi

if [ "$iOSLIST" = "7" ]; then
mv -v $MountRamdisk/usr/share/progressui/applelogo@2x.tga $MountRamdisk/usr/share/progressui/applelogo_orig.tga
bspatch $MountRamdisk/usr/share/progressui/applelogo_orig.tga $MountRamdisk/usr/share/progressui/applelogo@2x.tga ../patch/applelogo7.patch
fi
sleep 1s

umount $MountRamdisk
sleep 1s

mv $iOSBuild/$RestoreRamdisk $iOSBuild/t.dmg
../bin/xpwntool $iOSBuild/ramdisk.dmg $iOSBuild/$RestoreRamdisk -t $iOSBuild/t.dmg
rm $iOSBuild/ramdisk.dmg
rm $iOSBuild/t.dmg
rm -r 11D257

## zipping ipsw
cd $iOSBuild
zip ../../iPhone3,1_"$iOSVersion"_Custom.ipsw -r *

## clean up
cd ../../
rm -r tmp_ipsw
