#! /bin/bash
## This script is released under the GPL version 2
## copyright (2009) James Cook
## Thanks goes to Klaus Knopper who reminded me of something
## very simple that I had forgotten at the time, thanks bud.
## the author may be contacted at:
## azerthoth (at) gmail.com

## Check for user is root
## Thanks to micia for the suggestion
if [ $UID -ne 0 ]; then
   echo "You need to be root to run this script!"
   exit 1
fi

## get them all into /dev/mapper
modprobe dm-mod 2> /dev/null || :
vgscan --ignorelockingfailure --mknodes || :
vgchange -aly --ignorelockingfailure || return 2
clear
mkdir /LVM
cd /dev/mapper

## Create directories and mount
for FILE in *; do
test -b "$FILE" && mkdir /LVM/$FILE && mount /dev/mapper/$FILE /LVM/$FILE 2>/dev/null
done

## List good partitions
echo "Cleaning up LVMs that were swap partitions or with unsupported"
echo "File Systems from the list. This will not effect those partitions"
echo "There is just no need to list or parse them"
rmdir /LVM/Vol* 2>/dev/null"
echo " "
echo "The following LVM were mounted for you and are ready to use"
echo " "
ls /LVM
echo " "
echo "You can find them in /LVM"
echo " "

## chroot instructions
echo "If you are rescuing/fixing a previous installation please issue"
echo "the following commands"
echo "cp -L /etc/resolv.conf /LVM/<your_lvm_name>/etc/resolv.conf"
echo "mount -t proc none /LVM/<your_lvm_name>/proc"
echo "mount -o bind /dev /LVM/<your_lvm_name>/dev"
echo "chroot /LVM/<your_lvm_name> /bin/bash"
echo "env-update"
echo "source /etc/profile"
## this process may also be interactively automated in the future
## more coffee and ambition is needed
