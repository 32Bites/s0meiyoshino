<h2>s0meiyoshino v1.0</h2>

Please secure about 10 GB of free space.

(1) Download IPSW
Download "iPhone3,1_6.1.3_10B329_Restore.ipsw" and "iPhone3,1_7.1.2_11D257_Restore.ipsw" and place it in s0meiyoshino.

(1) Install packages
./install.sh

(2) make ipsw
./make_ipsw.sh

(3) Restore iPhone 4
Prepare to enter DFU mode
./restore.sh

!!! How to delete exploit !!!
This method adds "boot-partition=2" to the nvram variable.
Even if you restore it with OFW in iTunes, it will be in recovery mode as it is.

It can be deleted in the following way.
1) Jailbreak
2) exec command "nvram -d boot-partition"
3) reboot and restore

If you have already restored and you are in Recovery Mode
1) Booting SSH ramdisk
2) exec command "nvram -d boot-partition"
3) reboot and restore
or
1) Downgrade (Untethered or Tethered) iOS 6
2) Jailbreak and tethered boot by redsn0w
2) exec command "nvram -d boot-partition"
3) reboot and restore

<h3>Credit</h3>
@xerub for <a href="https://xerub.github.io/ios/iboot/2018/05/10/de-rebus-antiquis.html">De Rebus Antiquis</a>
@danzatt for <a href="https://github.com/danzatt/ios-dualboot">ios-dualboot(hfs_resize etc.)</a>
Roderick W. Smith - for gptfdisk
@iH8sn0w for <a href="https://github.com/iH8sn0w/iBoot32Patcher">iBoot32Patcher</a>
@tihmstar for <a href="https://github.com/tihmstar/iBoot32Patcher">Improvement of iBoot32Patcher</a>
@nyan_satan for <a href="https://github.com/NyanSatan/iBoot32Patcher">Improvement of iBoot32Patcher</a>
@ShadowLee19 for iBoot patch
@JonathanSeals for many tips
@Benfxmth for many tips
@daytonhasty for <a href="https://dayt0n.com/articles/Odysseus/">Odysseus</a>
@libimobiledev for idevicerestore
@planetbeing for xpwn
@axi0mX for <a href="https://github.com/axi0mX/ipwndfu">ipwndfu</a>
@posixninja and @pod2g for SHAtter exploit
