#!/bin/sh

git clone git@github.com:Ivan-Velickovic/sel4cp_vmm.git
cd sel4cp_vmm

echo Checking out main branch commit 6adaa4ddfc446ece0a35f9e5babb21945dee9a67
git checkout 6adaa4ddfc446ece0a35f9e5babb21945dee9a67

cp ../sel4cp_vmm.patches/*.patch .
git am 0005-Zynqmp-boards-firmware-calls-addressed.patch
git am 0006-Add-Ultra96V2-support.patch

