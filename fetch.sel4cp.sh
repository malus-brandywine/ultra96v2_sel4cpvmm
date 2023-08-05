#!/bin/sh

git clone git@github.com:Ivan-Velickovic/sel4cp.git sel4cp
cd sel4cp

echo Checking out dev branch, commit 20f95dd6d5858be8d7d702ed834779e093cac275
git checkout dev
git checkout 20f95dd6d5858be8d7d702ed834779e093cac275

cp ../sel4cp.patches/*.patch .
git am 0004-Add-support-of-seL4-with-SMC-capability.patch

