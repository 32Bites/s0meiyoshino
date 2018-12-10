#!/bin/bash

### Mount Root/Data-FS
if [ -e "/dev/rdisk0s2" ]; then
echo "Not supported"
nvram -d boot-partition
nvram -d boot-ramdisk
sleep 1s
reboot_
fi

mount_hfs /dev/disk0s1s1 /mnt1
if [ -e "/dev/rdisk0s1s2" ]; then
mount_hfs /dev/disk0s1s2 /mnt2
else
Xted="1"
mount_hfs /dev/disk0s1s3 /mnt2
fi
sleep 1s

### Disable OTA Update
rm -rf /mnt1/System/Library/LaunchDaemons/com.apple.mobile.softwareupdated.plist
rm -rf /mnt1/System/Library/LaunchDaemons/com.apple.softwareupdateservicesd.plist

#####################################################################
########################## Install Exploit ##########################
#####################################################################
Data_GUID="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Partition unique GUID: //p')"
LogicalSector="$((echo -e "p\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Logical sector size: //p' | sed 's/ .*//')"
System_LastSector="$((echo -e "i\n1\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Last sector: //p' | sed 's/ .*//')"
Data_LastSector="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Last sector: //p' | sed 's/ .*//')"
Data_Attributeflags="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*flags: //p')"
Exploit_LastSector="$((524288/$LogicalSector))"
New_Data_LastSector="$(($Data_LastSector-$Exploit_LastSector))"
New_Data_SectorSize="$(($New_Data_LastSector-$System_LastSector))"
New_Data_Size="$(($New_Data_SectorSize*$LogicalSector))"

### Resize Data-FS
hfs_resize /mnt2 $New_Data_Size
sleep 1s

### Install exploit_1st
if [ "$Data_Attributeflags" = "0001000000000000" ]; then
echo -e "d\n2\nn\n\n$New_Data_LastSector\n\nc\n2\nData\nx\na\n2\n48\n\nc\n2\n$Data_GUID\ns\n4\nm\nn\n3\n\n$Data_LastSector\n\nw\nY\n" | gptfdisk /dev/rdisk0s1
else
echo -e "d\n2\nn\n\n$New_Data_LastSector\n\nc\n2\nData\nx\na\n2\n48\n49\n\nc\n2\n$Data_GUID\ns\n4\nm\nn\n3\n\n$Data_LastSector\n\nw\nY\n" | gptfdisk /dev/rdisk0s1
fi
sleep 1s

### Install exploit_2nd
if [ "$Xted" = "1" ]; then
dd of=/dev/rdisk0s1s4 if=/ramdiskH.dmg bs=512k count=1
else
dd of=/dev/rdisk0s1s3 if=/ramdiskH.dmg bs=512k count=1
fi
sleep 1s

nvram boot-partition=2
sleep 1s

### Reboot ###
reboot_
