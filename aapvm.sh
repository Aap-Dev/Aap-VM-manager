#!/bin/bash

echo Aap VM the perfect virtual machine manager for the command line!

echo 1. Create new VM 2. Open existing VM

read -p "? " startupc

if [ "$startupc" == "1" ]; then
  echo "Creating new VM"
  read -p "What do you want to call your VM? " cname
  read -p "Os type? For example linux or windows " ost
  read -p "How much RAM is the VM allowed to use? (in MB) " cram
  read -p "How many CPU cores is the VM allowed to use? " vcpuc
  read -p "How much storage do you want to allocate to this VM? (in GB) " diskc
  read -p "Where is your ISO file located? " isoc




virt-install \
  --name $cname \
  --os-type=$ost \
  --memory $cram \
  --vcpus=$vcpuc \
  --disk path=/var/lib/libvirt/images/$cname.qcow2,size=$diskc \
  --disk $isoc,device=cdrom,bus=ide \
  --noautoconsole \
  --cdrom $isoc
virt-viewer



elif [ "$startupc" == "2" ]; then
  echo "Loading an existing VM"
  read -p "What is the name of your VM? " cname
  read -p "Os type? For example linux or windows " ost
  read -p "How much RAM is the VM allowed to use? (in MB) " cram
  read -p "How many CPU cores is the VM allowed to use? " vcpuc


virt-install \
  --name $cname \
  --noautoconsole \  
  --os-type=$ost \
  --memory $cram \
  --vcpus=$vcpuc \
  --disk path=/var/lib/libvirt/images/$cname.qcow2\
  --boot hd
virt-viewer



else
  echo "Please pick a valid option!"
fi
