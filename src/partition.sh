#!/bin/bash

### Mount Root/Data-FS
mount_hfs /dev/disk0s1s1 /mnt1
mount_hfs /dev/disk0s1s2 /mnt2
sleep 1s

Data_GUID="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Partition unique GUID: //p')"
LogicalSector="$((echo -e "p\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Logical sector size: //p' | sed 's/ .*//')"
System_FirstSector="$((echo -e "i\n1\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*First sector: //p' | sed 's/ .*//')"
System_LastSector="$((echo -e "i\n1\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Last sector: //p' | sed 's/ .*//')"
Data_FirstSector="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*First sector: //p' | sed 's/ .*//')"
Data_LastSector="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*Last sector: //p' | sed 's/ .*//')"
Data_Attributeflags="$((echo -e "i\n2\nq") | gptfdisk /dev/rdisk0s1 2>/dev/null | sed -n -e 's/^.*flags: //p')"
ExpSectorSize="$((524288/$LogicalSector))"
DataSecSize="$(($Data_LastSector-$ExpSectorSize))"
DataSize="$(($DataSecSize-$System_LastSector))"
DataResize="$(($DataSize*$LogicalSector))"

#######################
### Install Exploit ###
#######################

### Resize Data-FS
hfs_resize /mnt2 $DataResize
sleep 1s

### Install exploit_1
echo -e "d\n2\nn\n\n$DataSecSize\n\nc\n2\nData\nx\na\n2\n48\n49\n\nc\n2\n$Data_GUID\ns\n4\nm\nn\n3\n\n$Data_LastSector\n\nw\nY\n" | gptfdisk /dev/rdisk0s1
sleep 5s

### Install exploit_2
dd of=/dev/rdisk0s1s3 if=/ramdiskH.dmg bs=512k count=1
sleep 3s

nvram boot-partition=2
sleep 2s

### !!!!Reboot!!!! ###
reboot_
