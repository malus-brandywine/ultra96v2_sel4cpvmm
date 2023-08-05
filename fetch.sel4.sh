#!/bin/sh

git clone git@github.com:Ivan-Velickovic/seL4.git
cd seL4

echo Checking out sel4cp-dev branch, commit 88d1750089bcb2589114b6f77b6a24e8fa7eff42
git checkout sel4cp-dev
git checkout 88d1750089bcb2589114b6f77b6a24e8fa7eff42

cp ../sel4.patches/*.patch .
git am 0001-smc_cap-Add-SMC-Capability-with-Call-method.patch
git am 0002-smc_cap-Add-badge-handling-to-smc-cap.patch
git am 0003-smc_cap-allow-SMC-calls-for-non-VMM-threads.patch

