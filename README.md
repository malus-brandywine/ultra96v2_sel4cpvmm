
## Ultra96v2 Sel4cpvmm

The project implements support of Ultra96V2 in
[sel4cp_VMM](https://github.com/Ivan-Velickovic/sel4cp_vmm)
component.

</br>

Content: </br>
* Implementation highlights</br>
* Usage recommendations</br>

</br>

### Implementation highlights

#### seL4 modifications

While booting, Xilinx' Linux kernel makes several hundreds of firmware
services calls invoked via SMC. This project uses modifications to <i>seL4</i>
suggested by <b>Robbie VanVossen</b> and <b>Alex Pavey</b> (DornerWorks) to support
SMC call capability.</br>
The code was approved but has not been merged as of Aug 5, 2023:
[seL4/seL4, PR #701](https://github.com/seL4/seL4/pull/701)

</br>

DW's patches are (just names here):
- [PATCH 1/3] smc_cap: Add SMC Capability with Call method, 8 Nov 2021
- [PATCH 2/3] smc_cap: Add badge handling to smc cap, 30 Nov 2021
- [PATCH 3/3] smc_cap: allow SMC calls for non-VMM threads, 19 Dec 2022

</br>

#### seL4CP modifications

<i>sel4CP</i> was modified to deal with new system calls enumeration and newly
introduced SMC capability.</br>
(NB! <i>Sel4CP</i> has to be modified with the project's patch if you deal with
<i>seL4</i> supporting SMC capability no matter how the kernel was configured:
wheither to use SMC API or not)

</br>

What changed: Protection domain (PD) has got a new parameter - "smc".</br>
If it set, then PD receives a copy of SMC Call capability from the Monitor
task.

</br>

#### Ultra96v2 artefacts & seL4CP_VMM modifications

As for Ultra96v2 VM, the project provides artefacts required
by <i>sel4cp_VMM</i> component. This set of artefacts is a reference
minimalistic solution.

* linux.dts: The file keeps the whole list of the board devices that was
composed with Avnet build scripts. Most of devices are commented out
but kept in the file as references. Minimal mandatory set of devices
left actual: RAM, GIC, UART for the system console.

* linux: default Linux kernel image built with project
[petalinux-ultra96v2-sel4cpvmm](https://github.com/malus-brandywine/petalinux-ultra96v2-sel4cpvmm)

* rootfs.cpio.gz: minumal root FS image built with project
[petalinux-ultra96v2-sel4cpvmm](https://github.com/malus-brandywine/petalinux-ultra96v2-sel4cpvmm)

</br>

<i>seL4CP_VMM</i> modifications will be discussed in other communications.

</br>

### Usage recommendations


<i>ultra96v2_sel4cpvmm</i> provides 3 sets of patches for 3 source trees:
<i>seL4</i>, <i>seL4CP</i> and <i>sel4cp_VMM</i>.

* sel4.patches
* sel4cp.patches
* sel4cp_vmm.patches

[versions.md](https://github.com/malus-brandywine/ultra96v2_sel4cpvmm/blob/main/versions.md)
keeps the proper versions of the source trees ultra96v2_sel4cpvmm was built on.

</br>

<b>Option 1</b> You can use 3 helper scripts that do the job: they fetch the required versions
of the project source trees and apply patches to them. So, you'll get ready-to-use
directories to pass to your build system.

```
git clone git@github.com:malus-brandywine/ultra96v2-sel4cpvmm.git
cd ultra96v2-sel4cpvmm


./fetch.sel4.sh
./fetch.sel4cp.sh
./fetch.sel4cp_vmm.sh
```

<b>Option 2</b> Alternatively, you can git-clone the version of the source tree
mentioned in [versions.md](https://github.com/malus-brandywine/ultra96v2_sel4cpvmm/blob/main/versions.md)
and manually git-am the provided patches.

~
