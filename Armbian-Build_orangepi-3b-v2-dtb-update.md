## For legacy 5.xx kernel

Armbian default architecture only has `rk3566-orangepi-3b.dts` while the newer board requires `rk3566-orangepi-3b-v2.dts`
After completely downloading Armbian build framework 
```
sudo su
cd ~/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/arch/arm64/boot/dts/rockchip
ls | grep orangepi
rm rk3566-orangepi-3b.*
wget -O rk3566-orangepi-3b.dts https://raw.githubusercontent.com/orangepi-xunlong/linux-orangepi/orange-pi-5.10-rk35xx/arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b-v2.dts
```

## Verify dtb

```
cd ~/build
./compile.sh kernel-dtb BOARD=orangepi3b BRANCH=legacy IGNORE_UPDATES=yes SHARE_LOG=yes
```
Working output

```

Save New Duplicate & Edit Just Text
# Armbian ANSI build logs for 6fa0febe-ed3c-4f7f-84db-59d7574b323c - use "less -SR" to view
# Armbian build at Fri Aug 16 00:26:03 +03 2024 on ukhan
------------------------------------------------------------------------------------------------------------
# Repeat build: ./compile.sh kernel-dtb BOARD=orangepi3b BRANCH=legacy IGNORE_UPDATES=yes
# ARGs: 'PREFER_DOCKER=no' 'IGNORE_UPDATES=yes' 'ARMBIAN_RELAUNCHED=yes' 'BRANCH=legacy' 'BOARD=orangepi3b' 'SET_OWNER_TO_UID=1000' 'kernel-dtb'
------------------------------------------------------------------------------------------------------------
# GIT revision
   commit b8dbe607e59a9eb23c70f129b60e2df2b08cdb01 (grafted, HEAD -> main, origin/main, origin/HEAD)
   Author: ColorfulRhino <131405023+ColorfulRhino@users.noreply.github.com>
   
       partitioning: Declare `rootpart` as local variable
------------------------------------------------------------------------------------------------------------
# GIT status
   On branch main
   Your branch is up to date with 'origin/main'.
   
   Changes not staged for commit:
     (use "git add <file>..." to update what will be committed)
     (use "git restore <file>..." to discard changes in working directory)
   	modified:   config/boards/orangepi3b.csc
   	modified:   config/kernel/linux-rk35xx-legacy.config
   	modified:   config/kernel/linux-rk35xx-vendor.config
   	modified:   lib/functions/rootfs/rootfs-create.sh
   
   no changes added to commit (use "git add" and/or "git commit -a")
------------------------------------------------------------------------------------------------------------
### config_early_init.log 
--> (0) INFO: Starting single build process [ orangepi3b ]
--> (0) INFO: Checking [ basic host setup ]
--> (0) INFO: Build host OS release [ jammy ]
--> (0) INFO: Build host architecture [ amd64 ]
--> (0) INFO: Detected WSL2 - experimental support [ Windows Subsystem for Linux 2 ]
------------------------------------------------------------------------------------------------------------
### config_source_board_file.log 
--> (0) INFO: Sourcing board configuration [ /home/ukhan/build/config/boards/orangepi3b.csc ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing board file config/boards/orangepi3b.csc [ BOARDFAMILY='rk35xx' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing board file config/boards/orangepi3b.csc [ BOOTCONFIG='orangepi-3b-rk3566_defconfig' ]
--> (0) CHANGE-TRACKING: change-tracking: after defaulting LINUXFAMILY to BOARDFAMILY [ LINUXFAMILY='rk35xx' ]
------------------------------------------------------------------------------------------------------------
### do_main_configuration.log 
--> (0) INFO: Starting main configuration
--> (0) INFO: Using REVISION from [ main VERSION file: '24.8.0-trunk' ]
--> (0) INFO: Sourcing family configuration [ /home/ukhan/build/config/sources/families/rk35xx.conf ]
--> (0) INFO: Enabling extension [ rkbin-tools ]
--> (0) INFO: Determined BOOT_SOC from BOOTCONFIG [ BOOT_SOC: 'rk3566'; BOOTCONFIG: 'orangepi-3b-rk3566_defconfig' ]
--> (0) WARNING: WARNING: 'legacy' branch [ is deprecated and slated for removal. Please switch to another branch unless you know what you're doing :) ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ KERNELSOURCE='https://github.com/armbian/linux-rockchip.git' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ KERNEL_MAJOR_MINOR='5.10' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ KERNELBRANCH='branch:rk-5.10-rkr6' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ KERNELPATCHDIR='rk35xx-legacy' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ BOOTSOURCE='https://github.com/radxa/u-boot.git' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ BOOTBRANCH='branch:next-dev-v2024.03' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ BOOTPATCHDIR='legacy/u-boot-radxa-rk35xx' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ BOOTDIR='u-boot-rockchip64' ]
--> (0) CHANGE-TRACKING: change-tracking: after sourcing family config [ NETWORKING_STACK='network-manager' ]
--> (0) INFO: Sourcing arch configuration [ arm64.conf ]
--> (0) INFO: Using NETWORKING_STACK [ NETWORKING_STACK: network-manager ]
--> (0) INFO: Adding networking extensions [ net-network-manager, net-chrony ]
--> (0) INFO: Enabling extension [ net-network-manager ]
--> (0) INFO: Enabling extension [ net-chrony ]
--> (0) INFO: Enabling extension [ mesa-vpu ]
--> (0) INFO: Extension manager [ processed 14 Extension Methods calls and 21 Extension Method implementations ]
--> (0) INFO: orangepi3b [ mainline (Kwiboo's tree) u-boot overrides ]
--> (0) INFO: rockchip64_common: defaulting SERIALCON [ Setting SERIALCON to ttyFIQ0 for BRANCH='legacy' ]
--> (0) CHANGE-TRACKING: change-tracking: after post_family_config hooks [ BOOTSOURCE='https://github.com/Kwiboo/u-boot-rockchip.git'  # (was: 'https://github.com/radxa/u-boot.git') ]
--> (0) CHANGE-TRACKING: change-tracking: after post_family_config hooks [ BOOTBRANCH='branch:rk3xxx-2024.04'  # (was: 'branch:next-dev-v2024.03') ]
--> (0) CHANGE-TRACKING: change-tracking: after post_family_config hooks [ BOOTPATCHDIR='v2024.04-orangepi3b'  # (was: 'legacy/u-boot-radxa-rk35xx') ]
--> (0) CHANGE-TRACKING: change-tracking: after post_family_config hooks [ BOOTDIR='u-boot-orangepi3b'  # (was: 'u-boot-rockchip64') ]
------------------------------------------------------------------------------------------------------------
### do_extra_configuration.log 
--> (0) INFO: Extension: net-chrony: Adding extra package to image [ chrony ]
--> (0) INFO: Extension: net-network-manager: Adding extra packages to image [ network-manager network-manager-openvpn netplan.io ]
------------------------------------------------------------------------------------------------------------
### config_post_main.log 
--> (0) CHANGE-TRACKING: change-tracking: after late_family_config hooks [ LINUXCONFIG='linux-rk35xx-legacy' ]
--> (0) CHANGE-TRACKING: change-tracking: after late_family_config hooks [ KERNEL_PATCH_ARCHIVE_BASE='rk35xx' ]
--> (0) CHANGE-TRACKING: change-tracking: before handling KERNEL_MAJOR_MINOR in config_post_main [ BOOTSOURCEDIR='u-boot-worktree/u-boot-orangepi3b/rk3xxx-2024.04' ]
--> (0) CHANGE-TRACKING: change-tracking: before calling extension_finish_config [ LINUXSOURCEDIR='linux-kernel-worktree/5.10__rk35xx__arm64' ]
--> (0) INFO: Minimal configuration prepared for build [ prep_conf_main_minimal_ni ]
--> (0) INFO: Running artifact build in interactive mode [ log file will be incomplete ]
--> (0) EXT: Repeat Build Options (early) [ ./compile.sh kernel-dtb BOARD=orangepi3b BRANCH=legacy IGNORE_UPDATES=yes ]
------------------------------------------------------------------------------------------------------------
### check_dir_for_mount_options.log 
--> (0) INFO: Checked directory OK for mount options [ /home/ukhan/build/.tmp ('main temporary dir') ]
------------------------------------------------------------------------------------------------------------
### prepare_host_noninteractive.log 
--> (0) INFO: Preparing [ host ]
--> (0) COMMAND: update-ccache-symlinks
--> (0) INFO: Syncing clock [ host ]
--> (0) COMMAND: ntpdate pool.ntp.org
   16 Aug 00:25:36 ntpdate[30579]: adjust time server 161.9.147.35 offset -0.017527 sec
--> (7) INFO: Ignoring toolchains [ SKIP_EXTERNAL_TOOLCHAINS: yes ]
------------------------------------------------------------------------------------------------------------
### artifact_prepare_version.log 
--> (7) INFO: Setting kernel git cache TTL to [ 120 ]
--> (7) INFO: Producing new & caching [ GIT_INFO_KERNEL ]
--> (7) INFO: Fetching SHA1 of 'branch' 'refs/heads/rk-5.10-rkr6' [ https://github.com/armbian/linux-rockchip.git ]
--> (8) INFO: SHA1 of branch refs/heads/rk-5.10-rkr6 [ '709c51c64e1652d4f8c87b1815db86f56d188268' ]
--> (8) INFO: User patches directory for kernel [ /home/ukhan/build/userpatches/kernel/rk35xx-legacy ]
--> (8) INFO: Using kernel config file [ config/kernel/linux-rk35xx-legacy.config ]
--> (8) INFO: Kernel build starting [ linux-kernel-worktree/5.10__rk35xx__arm64 ]
--> (8) COMMAND: mkdir -p /home/ukhan/build/cache/git-bare
--> (8) INFO: Using full Kernel bare tree for 5.10 [ existing worktree points to full ]
------------------------------------------------------------------------------------------------------------
### kernel_prepare_bare_repo_from_oras_gitball.log 
--> (8) CACHEHIT: Kernel bare tree already exists [ /home/ukhan/build/cache/git-bare/kernel ]
--> (8) COMMAND: git --no-pager config --global --get safe.directory /home/ukhan/build/cache/git-bare/kernel
--> (8) INFO: Getting sources from Git [ kernel:5.10 rk-5.10-rkr6 ]
--> (8) COMMAND: echo /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/.git > /home/ukhan/build/cache/git-bare/kernel/.git/worktrees/5.10__rk35xx__arm64/gitdir
--> (8) COMMAND: git --no-pager config --global --get safe.directory /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64
--> (9) INFO: Fetching updates from remote repository [ kernel:5.10 rk-5.10-rkr6 ]
--> (9) COMMAND: /usr/bin/git --no-pager fetch --verbose --progress --recurse-submodules=no --no-tags https://github.com/armbian/linux-rockchip.git rk-5.10-rkr6
--> (10) INFO: git: Fetch from remote completed, rev-parsing... [ 'kernel:5.10' 'rk-5.10-rkr6' 'FETCH_HEAD' ]
--> (10) COMMAND: git --no-pager checkout -f -q 709c51c64e1652d4f8c87b1815db86f56d188268
--> (10) COMMAND: git --no-pager clean -q -d -f
--> (10) INFO: Using Kernel git revision [ 709c51c64e1652d4f8c87b1815db86f56d188268 at 'Wed Jul 10 12:57:26 +03 2024' ]
------------------------------------------------------------------------------------------------------------
### kernel_drivers_create_patches.log 
--> (10) CACHEHIT: Using cached drivers patch file for rk35xx-legacy [ sha1_709c51c64e1652d4f8c87b1815db86f56d188268_rk35xx_legacy_53de5ec0_54342ed7-01ba4719 ]
------------------------------------------------------------------------------------------------------------
### kernel_main_patching_python.log 
--> (10) INFO: Python3 version [ 3.10.12 - 'Python 3.10.12' ]
--> (10) INFO: pip3 version [ 22.0.2: 'pip 22.0.2 from /usr/lib/python3/dist-packages/pip (python 3.10)' ]
--> (10) INFO: Using cached pip packages for Python tools [ 075ca4a0253ac2251f3a8eaefbae1666954ab5282aeefc53fd3ecb16910a037d ]
--> (10) INFO: Calling Python patching script for kernel: [ https://github.com/armbian/linux-rockchip.git - branch:rk-5.10-rkr6 ]
--> (10) INFO: Using kernel patch dir: [ rk35xx-legacy ]
--> (10) COMMAND: [...shortened kernel patching...] /usr/bin/python3 /home/ukhan/build/lib/tools/patching.py
   Found patching config file: '/home/ukhan/build/patch/kernel/rk35xx-legacy/0000.patching_config.yaml'
   Applying 1 patches from 1 files of which 1 driver patches...
   -> 1/1: /home/ukhan/build/cache/patch/kernel-drivers/sha1_709c51c64e1652d4f8c87b1815db86f56d188268_rk35xx_legacy_53de5ec0_54342ed7-01ba4719(:1) 
   Autopatching DT Makefile in arch/arm64/boot/dts/rockchip with config 'CONFIG_ARCH_ROCKCHIP'...
   Read 19247 bytes from /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/arch/arm64/boot/dts/rockchip/Makefile
   Read 313 lines from /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/arch/arm64/boot/dts/rockchip/Makefile
   Wrote 315 lines to /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/arch/arm64/boot/dts/rockchip/Makefile
   Summary: kernel patching: 1 total patches; 1 applied; 0 with problems
                                            Summary of kernel patches                                          
   ╭────────────────────────────────────────────┬──────────────────┬──────────────────────────────────────────╮
   │ Patch / Status                             │ Diffstat / files │ Author / Subject                         │
   ├────────────────────────────────────────────┼──────────────────┼──────────────────────────────────────────┤
   │  sha1_709c51c64e1652d4f8c87b1815db86f56d18 │ (+0/-0)[] ?      │ Armbian Autopatcher: [AUTOGEN]           │
   │ 8268_rk35xx_legacy_53de5ec0_54342ed7-01ba4 │                  │ /home/ukhan/build/cache/patch/kernel-dr… │
   │ 719                                        │                  │                                          │
   ├────────────────────────────────────────────┼──────────────────┼──────────────────────────────────────────┤
   │ Armbian Bare DT auto-patch                 │                  │ Armbian Autopatcher: Armbian Bare DT     │
   │                                            │                  │ files for arch/arm64/boot/dts/rockchip   │
   ├────────────────────────────────────────────┼──────────────────┼──────────────────────────────────────────┤
   │ Armbian DT Makefile auto-patch             │ Makefile         │ Armbian Autopatcher: Armbian DT Makefile │
   │                                            │                  │ AutoPatch for                            │
   │                                            │                  │ arch/arm64/boot/dts/rockchip;            │
   │                                            │                  │ one-rule-per-dtb (arm64) style           │
   │                                            │                  │ (incremental)                            │
   ╰────────────────────────────────────────────┴──────────────────┴──────────────────────────────────────────╯
--> (13) COMMAND: cat /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/tmp.7C2S9RkRNN
--> (13) COMMAND: rm -f /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/tmp.7C2S9RkRNN
------------------------------------------------------------------------------------------------------------
### kernel_determine_toolchain.log 
--> (13) INFO: Cross compilation [ target arm64 on host amd64 ]
--> (13) INFO: Compiler version [ aarch64-linux-gnu-gcc 11.4.0 ]
------------------------------------------------------------------------------------------------------------
### kernel_config_initialize.log 
--> (13) INFO: Configuring kernel [ linux-rk35xx-legacy ]
--> (13) INFO: Using kernel config file [ config/kernel/linux-rk35xx-legacy.config ]
--> (13) COMMAND: cp -pv /home/ukhan/build/config/kernel/linux-rk35xx-legacy.config /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/.config
   '/home/ukhan/build/config/kernel/linux-rk35xx-legacy.config' -> '/home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/.config'
--> (13) COMMAND: env -i CCACHE_BASEDIR="/home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64" CCACHE_TEMPDIR="/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/ccache_tmp" PATH="/usr/bin:/home/ukhan/build/cache/pip/base/bin:/usr/lib/ccache:/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" PYTHONPATH="/home/ukhan/build/cache/pip/base/lib/python3.10/site-packages:" DPKG_COLORS=always XZ_OPT='--threads=0' TERM='xterm-256color' COLUMNS='120' COLORFGBG='' make '-j18' 'ARCH=arm64' 'LOCALVERSION=-legacy-rk35xx' 'CROSS_COMPILE=ccache  aarch64-linux-gnu-' 'KCFLAGS=-fdiagnostics-color=always -Wno-error=misleading-indentation ' 'SOURCE_DATE_EPOCH=1720605446' 'KBUILD_BUILD_TIMESTAMP=Wed Jul 10 12:57:26 +03 2024' 'KBUILD_BUILD_USER=armbian' 'KBUILD_BUILD_HOST=next' 'KGZIP=pigz' 'KBZIP2=pbzip2' olddefconfig 
     HOSTCC  scripts/basic/fixdep
     LEX     scripts/kconfig/lexer.lex.c
     YACC    scripts/kconfig/parser.tab.[ch]
     HOSTCC  scripts/kconfig/lexer.lex.o
     HOSTCC  scripts/kconfig/parser.tab.o
     HOSTLD  scripts/kconfig/conf
   #
   # No change to .config
   #
--> (16) COMMAND: ./scripts/config --enable EXPERT
--> (16) COMMAND: ./scripts/config --set-str CONFIG_LOCALVERSION ""
--> (16) COMMAND: ./scripts/config --enable CONFIG_IKCONFIG
--> (16) COMMAND: ./scripts/config --enable CONFIG_IKCONFIG_PROC
--> (16) COMMAND: ./scripts/config --enable CONFIG_GPIO_SYSFS
--> (16) COMMAND: cp -pv .config .config_after_kernel_config_extension
   '.config' -> '.config_after_kernel_config_extension'
--> (16) COMMAND: env -i CCACHE_BASEDIR="/home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64" CCACHE_TEMPDIR="/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/ccache_tmp" PATH="/usr/bin:/home/ukhan/build/cache/pip/base/bin:/usr/lib/ccache:/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" PYTHONPATH="/home/ukhan/build/cache/pip/base/lib/python3.10/site-packages:" DPKG_COLORS=always XZ_OPT='--threads=0' TERM='xterm-256color' COLUMNS='120' COLORFGBG='' make '-j18' 'ARCH=arm64' 'LOCALVERSION=-legacy-rk35xx' 'CROSS_COMPILE=ccache  aarch64-linux-gnu-' 'KCFLAGS=-fdiagnostics-color=always -Wno-error=misleading-indentation ' 'SOURCE_DATE_EPOCH=1720605446' 'KBUILD_BUILD_TIMESTAMP=Wed Jul 10 12:57:26 +03 2024' 'KBUILD_BUILD_USER=armbian' 'KBUILD_BUILD_HOST=next' 'KGZIP=pigz' 'KBZIP2=pbzip2' olddefconfig 
   #
   # No change to .config
   #
--> (19) INFO: No misconfigurations or missing kernel option dependencies detected [ info ]
--> (19) INFO: Kernel configuration [ linux-rk35xx-legacy ]
------------------------------------------------------------------------------------------------------------
### kernel_config_finalize.log 
--> (19) INFO: Compiling legacy kernel [ 5.10.160 ]
--> (19) WARNING: Kernel DTB-only for development [ KERNEL_DTB_ONLY: yes ]
------------------------------------------------------------------------------------------------------------
### kernel_build.log 
--> (19) INFO: Building kernel [ rk35xx linux-rk35xx-legacy dtbs ]
--> (19) COMMAND: ccache --zero-stats
   Statistics zeroed
--> (19) COMMAND: env -i CCACHE_BASEDIR="/home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64" CCACHE_TEMPDIR="/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/ccache_tmp" PATH="/usr/bin:/home/ukhan/build/cache/pip/base/bin:/usr/lib/ccache:/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" PYTHONPATH="/home/ukhan/build/cache/pip/base/lib/python3.10/site-packages:" DPKG_COLORS=always XZ_OPT='--threads=0' TERM='xterm-256color' COLUMNS='120' COLORFGBG='' make '-j18' 'ARCH=arm64' 'LOCALVERSION=-legacy-rk35xx' 'CROSS_COMPILE=ccache  aarch64-linux-gnu-' 'KCFLAGS=-fdiagnostics-color=always -Wno-error=misleading-indentation ' 'SOURCE_DATE_EPOCH=1720605446' 'KBUILD_BUILD_TIMESTAMP=Wed Jul 10 12:57:26 +03 2024' 'KBUILD_BUILD_USER=armbian' 'KBUILD_BUILD_HOST=next' 'KGZIP=pigz' 'KBZIP2=pbzip2' 'INSTALL_MOD_STRIP=1' 'INSTALL_DTBS_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs' 'INSTALL_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/image/boot' 'INSTALL_HDR_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/libc_headers' 'INSTALL_MOD_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/modules' dtbs 
     SYNC    include/config/auto.conf.cmd
     LEX     scripts/dtc/dtc-lexer.lex.c
     YACC    scripts/dtc/dtc-parser.tab.[ch]
     HOSTCC  scripts/dtc/dtc-lexer.lex.o
     HOSTCC  scripts/dtc/dtc-parser.tab.o
     HOSTLD  scripts/dtc/dtc
     DTC     arch/arm64/boot/dts/rockchip/px30-evb.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-evb-ddr3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-evb-ddr3-v10-avb.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-evb-ddr3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-mini-evb-ddr3-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-mini-evb-ddr3-v11-avb.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-evb-ddr3-v11-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-evb-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/px30-evb-ddr4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308-evb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308-evb-amic-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308-evb-amic-v13.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308-evb-dmic-pdm-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308-evb-dmic-pdm-v13.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308b-evb-amic-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308b-evb-amic-v10-amp.dtb
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:116.25-118.5: Warning (sound_dai_property): /spdif-rx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-rx@ff3b0000 or bad phandle (referred from sound-dai[0])
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:128.25-130.5: Warning (sound_dai_property): /spdif-tx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-tx@ff3a0000 or bad phandle (referred from sound-dai[0])
     DTC     arch/arm64/boot/dts/rockchip/rk3308bs-evb-amic-v11.dtb
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:116.25-118.5: Warning (sound_dai_property): /spdif-rx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-rx@ff3b0000 or bad phandle (referred from sound-dai[0])
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:128.25-130.5: Warning (sound_dai_property): /spdif-tx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-tx@ff3a0000 or bad phandle (referred from sound-dai[0])
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:116.25-118.5: Warning (sound_dai_property): /spdif-rx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-rx@ff3b0000 or bad phandle (referred from sound-dai[0])
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:128.25-130.5: Warning (sound_dai_property): /spdif-tx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-tx@ff3a0000 or bad phandle (referred from sound-dai[0])
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:116.25-118.5: Warning (sound_dai_property): /spdif-rx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-rx@ff3b0000 or bad phandle (referred from sound-dai[0])
     DTC     arch/arm64/boot/dts/rockchip/rk3308bs-evb-ddr3-v20-rk618-rgb2dsi.dtb
   arch/arm64/boot/dts/rockchip/rk3308-evb-v11.dtsi:128.25-130.5: Warning (sound_dai_property): /spdif-tx-sound/simple-audio-card,cpu: Missing property '#sound-dai-cells' in node /spdif-tx@ff3a0000 or bad phandle (referred from sound-dai[0])
     DTC     arch/arm64/boot/dts/rockchip/rk3308bs-evb-dmic-pdm-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308bs-evb-mcu-display-v20.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308bs-evb-mipi-display-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3308bs-evb-rgb-display-v20.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3318-a95x-z2.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-evb-lp3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-evb-lp3-v10-avb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-evb-lp3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-evb-lp3-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-evb-lp3-v11-avb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-evb-lp3-v12-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-odroid-go2.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-863-lp3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-863-lp3-v10-avb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3326-863-lp3-v10-rkisp1.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3328-a1.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3328-evb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2s.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3328-rock64.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3328-roc-cc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3358-evb-ddr3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3358m-vehicle-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3368-evb-act8846.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3368-geekbox.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3368-orion-r68-meta.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3368-px5-evb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3368-r88.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-evb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-ficus.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-firefly.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-bob.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-kevin.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-inx.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-gru-scarlet-kd.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-khadas-edge.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-captain.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-khadas-edge-v.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-leez-p710.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-nanopc-t4.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-nanopi-m4.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-nanopi-neo4.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-orangepi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-puma-haikou.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-roc-pc-mezzanine.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4a.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4b.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4c.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-rock960.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-rockpro64-v2.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-sapphire.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator-edp-avb.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3399pro-rock-pi-n10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-demo1-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-demo4-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-demo4-ddr4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-demo6-ddr3-v10.dtb
   arch/arm64/boot/dts/rockchip/rk3399-sapphire-excavator-edp.dtsi:94.9-98.5: Warning (graph_port): /panel/ports: graph port node name should be 'port'
     DTC     arch/arm64/boot/dts/rockchip/rk3528-evb1-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-evb1-ddr4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-evb1-ddr4-v10-spi-nand-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-evb2-ddr3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-evb3-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-evb4-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-iotest-lp3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-hinlink-ht2.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3528-mangopi-m28k.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-dictpen-test3-v20.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-linux-amp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-lvds.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-mcu-k350c4516t.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-rgb2lvds.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-rgb-FX070-DHM11BOE-A.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-rgb-k350c4516t.dtb
   arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-mcu-k350c4516t.dts:270.13-278.4: Warning (graph_endpoint): /vop@ff400000/ports/port@0/mcu-timing: graph endpoint node name should be 'endpoint'
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-sii9022-rgb2hdmi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb1-lp4x-v10-spdif.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10-dual-camera.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10-image-reverse.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10-pdm-mic-array.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-evb2-ddr4-v10-sii9022-bt1120-to-hdmi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-iotest-lp3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-iotest-lp3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-iotest-lp3-v10-dsm.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-rk817-tablet-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-test1-ddr3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562-test2-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3562j-core-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-box-demo-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb-mipitest-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb1-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb1-ddr4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb1-ddr4-v10-lvds.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb2-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb2-lp4x-v10-edp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb2-lp4x-v10-eink.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb2-lp4x-v10-i2s-mic-array.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb2-lp4x-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb2-lp4x-v10-pdm-mic-array.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb3-ddr3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb3-ddr3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-evb5-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-orangepi-3b.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-radxa-zero3.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-radxa-zero3-ap6212.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-firefly-roc-pc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-eink.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-eink-w6.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-eink-w103.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-tablet.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-tablet-k108.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-tablet-rkg11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-rk817-tablet-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3566-taishanpi-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3567-evb2-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3567-evb2-lp4x-v10-dual-channel-lvds.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3567-evb2-lp4x-v10-dual-lvds.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb1-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb1-ddr4-v10-dual-camera.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb1-ddr4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb1-ddr4-v10-linux-amp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb1-ddr4-v10-linux-spi-nor.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb2-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb2-lp4x-v10-bt1120-to-hdmi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb4-lp3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb5-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10-rk628-bt1120-to-hdmi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10-rk628-rgb2dsi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10-rk628-rgb2hdmi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10-rk628-rgb2lvds.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb6-ddr3-v10-rk630-bt656-to-cvbs.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb7-ddr4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb8-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-evb8-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-hinlink-hnas.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-iotest-ddr3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-iotest-ddr3-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nanopi5-rev01.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nanopi5-rev02.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nanopi5-rev03.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nanopi5-rev04.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nanopi5-rev05.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nanopi5-rev07.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nvr-demo-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nvr-demo-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nvr-demo-v10-linux-spi-nand.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nvr-demo-v12-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-nvr-demo-v12-linux-spi-nand.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-radxa-e25.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-yy3568.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-toybrick-sd0-android.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-toybrick-sd0-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-toybrick-x0-android.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568-toybrick-x0-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-bananapi-m7.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blade3-v101-linux.dtb
   arch/arm64/boot/dts/rockchip/rk3568-yy3568.dts:757.26-767.4: Warning (i2c_bus_reg): /i2c@fe5e0000/mxc6655xa@15: missing or empty reg property
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blueberry-edge-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blueberry-edge-v12-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blueberry-edge-v12-maizhuo-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blueberry-edge-v14-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blueberry-minipc-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-blueberry-minipc-mizhuo-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-camera-csi-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-camera-dvp-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-dsi0-command2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-dsi0-command2lvds0-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-dsi0-command2rgb-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-dsi1-command2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-dsi1-command2lvds0-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-dsi1-command2rgb-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-rgb2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-rgb2lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-rgb2rgb-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-lvds2lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-evb-display-lvds2rgb-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi0-command2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi0-command2dual_lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi0-command2lvds0-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi0-dsi1-command2dual_lvdsx2-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi1-command2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi1-command2dual_lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-dsi1-command2lvds0-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-lvds2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-lvds2dual-lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-lvds2dual-lvds-vehicle-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-lvds2lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-lvds2rgb-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-rgb2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-rgb2dual-lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-rgb2dual-lvds-vehicle-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-rgb2lvds-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-rgb2rgb-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-super-frame-dsi0-command2dsi-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3568m-serdes-v1-evb-display-super-frame-dsi0-command2lvds0-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10-dsi-dsc-MV2100UZ1.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10-ipc-6x-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10-linux-amp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10-linux-ipc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb1-lp4-v10-lt6911uxe.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb2-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb2-lp4-v10-edp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb2-lp4-v10-edp2dp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb2-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb3-lp5-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb3-lp5-v10-edp.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb3-lp5-v10-edp-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb3-lp5-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb4-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb4-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb5-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb5-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb6-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb6-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb7-lp4-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb7-lp4-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb7-lp4-v10-rk1608-ipc-8x-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb7-lp4-v11-linux-ipc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb7-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-evb7-v11-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-fxblox-rk1.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-hinlink-h88k.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-armsom-sige7.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nanopc-cm3588-nas.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo-v10-android.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo-v10-ipc-4x-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo-v10-spi-nand.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo1-v21.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo1-v21-android.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo3-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-nvr-demo3-v10-android.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-pcie-ep-demo-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-pcie-ep-demo-v11-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-mixtile-core3588e.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0-android.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-v20.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-v21.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-v22.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588-vehicle-s66-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb1-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb1-lp4x-v10-linux.dtb
   arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-image-reverse.dtsi:78.15-96.5: Warning (phys_property): /cif_phy/csi2_dcphy0: Missing property '#phy-cells' in node /mipi-dcphy-dummy or bad phandle (referred from phys[0])
   arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-image-reverse.dtsi:97.15-115.5: Warning (phys_property): /cif_phy/csi2_dcphy1: Missing property '#phy-cells' in node /mipi-dcphy-dummy or bad phandle (referred from phys[0])
   arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-image-reverse.dtsi:78.15-96.5: Warning (phys_property): /cif_phy/csi2_dcphy0: Missing property '#phy-cells' in node /mipi-dcphy-dummy or bad phandle (referred from phys[0])
   arch/arm64/boot/dts/rockchip/rk3588-vehicle-evb-image-reverse.dtsi:97.15-115.5: Warning (phys_property): /cif_phy/csi2_dcphy1: Missing property '#phy-cells' in node /mipi-dcphy-dummy or bad phandle (referred from phys[0])
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb2-lp5-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb2-lp5-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb3-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb3-lp4x-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb3-lp4x-v10-nvp6158-ahd-to-bt1120.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb3-lp4x-v10-rk630-bt656-to-cvbs.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb3-lp4x-v10-sii9022-bt1120-to-hdmi.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb4-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb4-lp4x-v10-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-evb8-lp4x-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-9tripod-linux.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6c.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-nanopi-r6s.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5b.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-radxa-nx5-io.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-tablet-rk806-single-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-tablet-v10.dtb
     DTC     arch/arm64/boot/dts/rockchip/rk3588s-tablet-v11.dtb
     DTC     arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-camera-imx415-4k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dtbo
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dts:103.5-15: Warning (reg_format): /fragment@2/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dts:309.5-18: Warning (reg_format): /fragment@7/__overlay__/gt9xx@14:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dts:100.24-250.6: Warning (avoid_default_addr_size): /fragment@2/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dts:100.24-250.6: Warning (avoid_default_addr_size): /fragment@2/__overlay__/panel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dts:306.20-320.6: Warning (avoid_default_addr_size): /fragment@7/__overlay__/gt9xx@14: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/armsom-sige7-display-10hd.dts:306.20-320.6: Warning (avoid_default_addr_size): /fragment@7/__overlay__/gt9xx@14: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dts:65.5-15: Warning (reg_format): /fragment@1/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dts:183.5-18: Warning (reg_format): /fragment@13/__overlay__/touchscreen@14:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dts:62.24-83.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dts:62.24-83.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/panel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dts:181.28-194.6: Warning (avoid_default_addr_size): /fragment@13/__overlay__/touchscreen@14: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd1.dts:181.28-194.6: Warning (avoid_default_addr_size): /fragment@13/__overlay__/touchscreen@14: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-sata.dtbo
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dts:65.5-15: Warning (reg_format): /fragment@1/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dts:185.5-18: Warning (reg_format): /fragment@13/__overlay__/touchscreen@14:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dts:62.24-83.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dts:62.24-83.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/panel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dts:183.28-196.6: Warning (avoid_default_addr_size): /fragment@13/__overlay__/touchscreen@14: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-lcd2.dts:183.28-196.6: Warning (avoid_default_addr_size): /fragment@13/__overlay__/touchscreen@14: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-ap6275p.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-disable-led.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-disable-leds.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-hdmi2-8k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-ov13850.dtbo
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dts:77.5-15: Warning (reg_format): /fragment@2/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dts:128.5-18: Warning (reg_format): /fragment@4/__overlay__/touchscreen@14:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dts:74.24-95.6: Warning (avoid_default_addr_size): /fragment@2/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dts:74.24-95.6: Warning (avoid_default_addr_size): /fragment@2/__overlay__/panel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dts:126.28-139.6: Warning (avoid_default_addr_size): /fragment@4/__overlay__/touchscreen@14: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-lcd.dts:126.28-139.6: Warning (avoid_default_addr_size): /fragment@4/__overlay__/touchscreen@14: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-ov13855.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-plus-sata2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-sfc.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-cam1.dtbo
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dts:67.5-15: Warning (reg_format): /fragment@1/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dts:108.5-18: Warning (reg_format): /fragment@2/__overlay__/touchscreen@14:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dts:64.24-85.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dts:64.24-85.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/panel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dts:106.28-119.6: Warning (avoid_default_addr_size): /fragment@2/__overlay__/touchscreen@14: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-lcd.dts:106.28-119.6: Warning (avoid_default_addr_size): /fragment@2/__overlay__/touchscreen@14: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-cam2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/orangepi-5-pro-disable-leds.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-hdmi-8k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-i2c5-rtc-hym8563.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-radxa-camera-4k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-radxa-display-10hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-radxa-display-10fhd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-radxa-display-8hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-spi-nor-flash.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-usb-otg.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5a-sata.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-hdmi1-8k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-hdmi2-8k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-pd-max-voltage-12v.dtbo
   arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dts:49.5-18: Warning (reg_format): /fragment@1/__overlay__/camera-imx219@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dts:47.36-65.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera-imx219@10: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/rock-5a-rpi-camera-v2.dts:47.36-65.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera-imx219@10: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-radxa-display-10hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-radxa-display-8hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-radxa-display-10fhd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-radxa-camera-4k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5b-sata.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-radxa-camera-4k-on-cam0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-radxa-camera-4k-on-cam1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-radxa-display-8hd-on-lcd1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-radxa-display-8hd-on-lcd0.dtbo
   arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dts:49.5-18: Warning (reg_format): /fragment@1/__overlay__/camera-imx219@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dts:47.36-65.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera-imx219@10: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/rock-5b-rpi-camera-v2.dts:47.36-65.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera-imx219@10: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-cm5-io-radxa-camera-4k.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-cm5-io-raspi-7inch-touchscreen.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-cm5-io-radxa-display-10hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-cm5-io-radxa-display-8hd.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-cm5-io-rpi-camera-v2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-cm5-io-sata.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dtbo
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dts:138.6-16: Warning (reg_format): /fragment@2/__overlay__/ports/port@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dts:137.12-145.7: Warning (avoid_default_addr_size): /fragment@2/__overlay__/ports/port@1: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dts:137.12-145.7: Warning (avoid_default_addr_size): /fragment@2/__overlay__/ports/port@1: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dts:108.11-112.7: Warning (graph_port): /fragment@0/__overlay__/edp0-panel/ports: graph port node name should be 'port'
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dts:139.6-27: Warning (graph_port): /fragment@2/__overlay__/ports/port@1:#address-cells: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dts:140.6-24: Warning (graph_port): /fragment@2/__overlay__/ports/port@1:#size-cells: graph node '#size-cells' is -1, must be 0
     DTC     arch/arm64/boot/dts/rockchip/overlay/turing-rk1-sata2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/mixtile-blade3-sata2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-zero3-rpi-camera-v2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-zero3-rpi-camera-v1.3.dtbo
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dts:49.5-18: Warning (reg_format): /fragment@1/__overlay__/camera1-imx219@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dts:47.38-65.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera1-imx219@10: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dts:47.38-65.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera1-imx219@10: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-zero3-external-antenna.dtbo
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dts:50.5-18: Warning (reg_format): /fragment@1/__overlay__/camera0-imx219@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dts:48.38-66.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera0-imx219@10: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dts:48.38-66.6: Warning (avoid_default_addr_size): /fragment@1/__overlay__/camera0-imx219@10: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-zero3-disabled-ethernet.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/radxa-zero3-disabled-wireless.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/yy3568-display-dsi0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/yy3568-display-dsi1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/yy3568-sata2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dtbo
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:79.11-24: Warning (reg_format): /fragment@2/__overlay__/gc8034@37:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
     DTC     arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dtbo
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:103.11-24: Warning (reg_format): /fragment@2/__overlay__/os04a10@36:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:126.11-24: Warning (reg_format): /fragment@2/__overlay__/ov5695@36:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:77.31-99.12: Warning (avoid_default_addr_size): /fragment@2/__overlay__/gc8034@37: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:77.31-99.12: Warning (avoid_default_addr_size): /fragment@2/__overlay__/gc8034@37: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:101.30-122.12: Warning (avoid_default_addr_size): /fragment@2/__overlay__/os04a10@36: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:101.30-122.12: Warning (avoid_default_addr_size): /fragment@2/__overlay__/os04a10@36: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:124.28-146.12: Warning (avoid_default_addr_size): /fragment@2/__overlay__/ov5695@36: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-camera.dts:124.28-146.12: Warning (avoid_default_addr_size): /fragment@2/__overlay__/ov5695@36: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rockchip-rk3588-opp-oc-24ghz.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-can0-m0.dtbo
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dts:117.12-22: Warning (reg_format): /fragment@2/__overlay__/ports/port@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dts:116.18-122.13: Warning (avoid_default_addr_size): /fragment@2/__overlay__/ports/port@1: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dts:116.18-122.13: Warning (avoid_default_addr_size): /fragment@2/__overlay__/ports/port@1: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dts:116.18-122.13: Warning (graph_port): /fragment@2/__overlay__/ports/port@1: graph node '#address-cells' is -1, must be 1
   arch/arm64/boot/dts/rockchip/overlay/yy3568-display-edp.dts:116.18-122.13: Warning (graph_port): /fragment@2/__overlay__/ports/port@1: graph node '#size-cells' is -1, must be 0
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-can1-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-can1-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-can2-m1.dtbo
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dts:128.5-15: Warning (reg_format): /fragment@6/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dts:125.24-726.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi1.dts:125.24-726.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/panel@0: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-dwc3-host.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-dwc3-peripheral.dtbo
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dts:146.5-18: Warning (reg_format): /fragment@6/__overlay__/dw9714b@c:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dts:160.5-18: Warning (reg_format): /fragment@6/__overlay__/imx415b@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dts:143.23-155.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/dw9714b@c: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dts:143.23-155.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/dw9714b@c: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dts:157.24-180.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/imx415b@1a: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam2.dts:157.24-180.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/imx415b@1a: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:128.5-15: Warning (reg_format): /fragment@6/__overlay__/panel@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c0-m1.dtbo
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:771.5-18: Warning (reg_format): /fragment@7/__overlay__/ft5336@38:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:782.5-18: Warning (reg_format): /fragment@7/__overlay__/gt9xx@14:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:125.24-745.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/panel@0: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:125.24-745.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/panel@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:769.22-778.6: Warning (avoid_default_addr_size): /fragment@7/__overlay__/ft5336@38: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:769.22-778.6: Warning (avoid_default_addr_size): /fragment@7/__overlay__/ft5336@38: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:780.20-789.6: Warning (avoid_default_addr_size): /fragment@7/__overlay__/gt9xx@14: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-display-dsi0.dts:780.20-789.6: Warning (avoid_default_addr_size): /fragment@7/__overlay__/gt9xx@14: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c1-m0.dtbo
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dts:146.5-18: Warning (reg_format): /fragment@6/__overlay__/dw9714c@c:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dts:159.5-18: Warning (reg_format): /fragment@6/__overlay__/imx415@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dts:143.23-155.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/dw9714c@c: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dts:143.23-155.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/dw9714c@c: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dts:157.22-178.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/imx415@1a: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam3.dts:157.22-178.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/imx415@1a: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c1-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c1-m4.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c2-m0.dtbo
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dts:145.5-18: Warning (reg_format): /fragment@6/__overlay__/dw9714f@c:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dts:159.5-18: Warning (reg_format): /fragment@6/__overlay__/imx415f@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dts:142.23-154.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/dw9714f@c: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dts:142.23-154.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/dw9714f@c: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dts:156.24-179.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/imx415f@1a: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/khadas-edge2-cam1.dts:156.24-179.6: Warning (avoid_default_addr_size): /fragment@6/__overlay__/imx415f@1a: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c2-m4.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c3-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c3-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c4-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c5-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c6-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c6-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c6-m4.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c7-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c8-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-i2c8-m4.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-ov13850-c1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-ov13850-c2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-ov13850-c3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-ov13855-c2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-ov13855-c1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm0-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm0-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm0-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm10-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-ov13855-c3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm11-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm11-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm12-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm13-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm13-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm14-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm14-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm14-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm15-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm15-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm15-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm15-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm1-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm1-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm1-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm2-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm3-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm3-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm3-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm3-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm5-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm6-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm7-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm6-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm8-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-pwm7-m3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi0-m1-cs0-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi0-m1-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi0-m2-cs0-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi0-m2-cs0-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi0-m2-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs0-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi4-m0-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi4-m1-cs0-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi4-m1-cs0-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi4-m1-cs1-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-spi4-m2-cs0-spidev.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart0-m2.dtbo
   arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dts:25.5-15: Warning (reg_format): /fragment@0/__overlay__/mcp2515@1:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dts:23.20-35.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/mcp2515@1: Relying on default #address-cells value
   arch/arm64/boot/dts/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dts:23.20-35.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/mcp2515@1: Relying on default #size-cells value
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart1-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart2-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart2-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart3-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart3-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart4-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart4-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart6-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart6-m1-full.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart7-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart7-m1-full.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart8-m0.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart8-m0-full.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart7-m2.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-uart8-m1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-w1-gpio3-b3.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-w1-gpio4-b1.dtbo
     DTC     arch/arm64/boot/dts/rockchip/overlay/rk3588-hdmirx.dtbo
--> (32) INFO: Kernel built in [ 13 seconds - 5.10.160-rk35xx ]
--> (32) WARNING: Kernel DTB-only for development [ Installing DTBs ]
------------------------------------------------------------------------------------------------------------
### kernel_build.log 
--> (32) INFO: Building kernel [ rk35xx linux-rk35xx-legacy dtbs_install ]
--> (32) COMMAND: ccache --zero-stats
   Statistics zeroed
--> (32) COMMAND: env -i CCACHE_BASEDIR="/home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64" CCACHE_TEMPDIR="/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/ccache_tmp" PATH="/usr/bin:/home/ukhan/build/cache/pip/base/bin:/usr/lib/ccache:/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/snap/bin" PYTHONPATH="/home/ukhan/build/cache/pip/base/lib/python3.10/site-packages:" DPKG_COLORS=always XZ_OPT='--threads=0' TERM='xterm-256color' COLUMNS='120' COLORFGBG='' make '-j18' 'ARCH=arm64' 'LOCALVERSION=-legacy-rk35xx' 'CROSS_COMPILE=ccache  aarch64-linux-gnu-' 'KCFLAGS=-fdiagnostics-color=always -Wno-error=misleading-indentation ' 'SOURCE_DATE_EPOCH=1720605446' 'KBUILD_BUILD_TIMESTAMP=Wed Jul 10 12:57:26 +03 2024' 'KBUILD_BUILD_USER=armbian' 'KBUILD_BUILD_HOST=next' 'KGZIP=pigz' 'KBZIP2=pbzip2' 'INSTALL_MOD_STRIP=1' 'INSTALL_DTBS_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs' 'INSTALL_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/image/boot' 'INSTALL_HDR_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/libc_headers' 'INSTALL_MOD_PATH=/home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/modules' dtbs_install 
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb-ddr3-v10-avb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb-ddr3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-mini-evb-ddr3-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-mini-evb-ddr3-v11-avb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb-ddr3-v11-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/px30-evb-ddr4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308-evb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308-evb-amic-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308-evb-amic-v13.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308-evb-dmic-pdm-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308-evb-dmic-pdm-v13.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308-roc-cc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308b-evb-amic-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308b-evb-amic-v10-amp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308bs-evb-amic-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308bs-evb-ddr3-v20-rk618-rgb2dsi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/armsom-sige7-camera-imx415-4k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308bs-evb-dmic-pdm-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/armsom-sige7-display-10hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308bs-evb-mcu-display-v20.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-lcd1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308bs-evb-mipi-display-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-lcd2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-sata.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3318-a95x-z2.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-ap6275p.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3308bs-evb-rgb-display-v20.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-disable-led.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-plus-disable-leds.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-evb-lp3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-evb-lp3-v10-avb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-evb-lp3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-plus-hdmi2-8k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-evb-lp3-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-evb-lp3-v11-avb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-plus-lcd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-evb-lp3-v12-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-plus-ov13850.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-odroid-go2.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-plus-ov13855.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-863-lp3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-863-lp3-v10-avb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3326-863-lp3-v10-rkisp1.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-plus-sata2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3328-a1.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-pro-lcd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3328-evb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-pro-sfc.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3328-nanopi-r2s.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3328-rock64.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3328-roc-cc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-pro-cam1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3358-evb-ddr3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-pro-cam2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3358m-vehicle-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/orangepi-5-pro-disable-leds.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-hdmi-8k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3368-evb-act8846.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-i2c5-rtc-hym8563.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3368-lion-haikou.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3368-geekbox.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3368-orion-r68-meta.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-radxa-camera-4k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-radxa-display-10hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3368-px5-evb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-radxa-display-8hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3368-r88.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-radxa-display-10fhd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-spi-nor-flash.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-evb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-ficus.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-usb-otg.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-firefly.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-gru-kevin.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-rpi-camera-v2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-gru-bob.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-gru-scarlet-inx.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5a-sata.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-gru-scarlet-kd.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-hdmi1-8k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-hdmi2-8k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-pd-max-voltage-12v.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-hugsun-x99.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-radxa-display-10hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-khadas-edge.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-khadas-edge-captain.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-radxa-display-8hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-khadas-edge-v.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-radxa-display-10fhd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-leez-p710.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-rpi-camera-v2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-nanopc-t4.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-nanopi-m4.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-radxa-camera-4k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5b-sata.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-nanopi-neo4.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5-itx-radxa-camera-4k-on-cam0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-orangepi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-pinebook-pro.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5-itx-radxa-camera-4k-on-cam1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5-itx-radxa-display-8hd-on-lcd1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5-itx-radxa-display-8hd-on-lcd0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rock-5-itx-enable-sharp-lq133t1jw01-edp-lcd-disable-dp1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-puma-haikou.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-roc-pc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-cm5-io-radxa-camera-4k.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-roc-pc-mezzanine.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-rock-pi-4a.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-cm5-io-raspi-7inch-touchscreen.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-cm5-io-radxa-display-10hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-rock-pi-4b.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-rock-pi-4c.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-cm5-io-radxa-display-8hd.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-rock960.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-cm5-io-rpi-camera-v2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-rockpro64-v2.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-rockpro64.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-cm5-io-sata.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-sapphire.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-sapphire-excavator.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-nx5-io-rpi-camera-v2-cam1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399-sapphire-excavator-edp-avb.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/turing-rk1-sata2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3399pro-rock-pi-n10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-demo1-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/mixtile-blade3-sata2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-zero3-rpi-camera-v2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-demo4-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-zero3-rpi-camera-v1.3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-demo4-ddr4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-zero3-external-antenna.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-zero3-disabled-ethernet.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-evb1-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-demo6-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/radxa-zero3-disabled-wireless.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-evb1-ddr4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/yy3568-camera.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-evb1-ddr4-v10-spi-nand-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/yy3568-display-dsi0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-evb2-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-evb3-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/yy3568-display-dsi1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/yy3568-display-edp.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/yy3568-sata2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-evb4-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/khadas-edge2-display-dsi0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-iotest-lp3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-hinlink-h28k.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/khadas-edge2-display-dsi1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-hinlink-ht2.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3528-mangopi-m28k.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/khadas-edge2-cam1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/khadas-edge2-cam2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-dictpen-test3-v20.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/khadas-edge2-cam3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rockchip-rk3588-opp-oc-24ghz.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-linux-amp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-can1-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-can0-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-can1-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-lvds.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-can2-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-mcu-k350c4516t.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-dwc3-host.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-dwc3-peripheral.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-rgb2lvds.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c0-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-rgb-FX070-DHM11BOE-A.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c1-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-rgb-k350c4516t.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c1-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-sii9022-rgb2hdmi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c1-m4.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c2-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c2-m4.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb1-lp4x-v10-spdif.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c3-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb2-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c3-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c4-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb2-ddr4-v10-dual-camera.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c5-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c6-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb2-ddr4-v10-image-reverse.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c6-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb2-ddr4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c6-m4.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb2-ddr4-v10-pdm-mic-array.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c7-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-evb2-ddr4-v10-sii9022-bt1120-to-hdmi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c8-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-iotest-lp3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-i2c8-m4.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-iotest-lp3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-ov13850-c1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-ov13850-c2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-iotest-lp3-v10-dsm.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-ov13850-c3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-rk817-tablet-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-ov13855-c1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-test1-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-ov13855-c2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562-test2-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-ov13855-c3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3562j-core-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm0-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm0-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-box-demo-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm10-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb-mipitest-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb1-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm0-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm11-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm11-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb1-ddr4-v10-lvds.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm12-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb2-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb1-ddr4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb2-lp4x-v10-edp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm13-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb2-lp4x-v10-eink.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm13-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb2-lp4x-v10-i2s-mic-array.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm14-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb2-lp4x-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm14-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb2-lp4x-v10-pdm-mic-array.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm14-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb3-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm15-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm15-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb5-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-evb3-ddr3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm15-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-orangepi-3b.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm15-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-radxa-zero3.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm1-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-radxa-zero3-ap6212.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm1-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm1-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-firefly-roc-pc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm2-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm3-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm3-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-eink.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm3-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-eink-w6.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm3-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-eink-w103.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm5-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-tablet.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-tablet-k108.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-tablet-rkg11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm6-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm6-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm7-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-rk817-tablet-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm7-m3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3566-taishanpi-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-pwm8-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi0-m1-cs0-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3567-evb2-lp4x-v10-dual-channel-lvds.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3567-evb2-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi0-m1-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3567-evb2-lp4x-v10-dual-lvds.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi0-m2-cs0-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb1-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi0-m2-cs0-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb1-ddr4-v10-dual-camera.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi0-m2-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi1-m1-cs0-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb1-ddr4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi1-m1-cs1-mcp2515-8mhz.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb1-ddr4-v10-linux-amp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi1-m1-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb1-ddr4-v10-linux-spi-nor.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi4-m0-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi4-m1-cs0-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb2-lp4x-v10-bt1120-to-hdmi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb2-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi4-m1-cs0-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi4-m1-cs1-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb4-lp3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb5-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-spi4-m2-cs0-spidev.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart0-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart1-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10-rk628-bt1120-to-hdmi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart2-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10-rk628-rgb2dsi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart2-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10-rk628-rgb2hdmi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart3-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10-rk628-rgb2lvds.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart3-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart4-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb6-ddr3-v10-rk630-bt656-to-cvbs.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart4-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart6-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb7-ddr4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb8-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart6-m1-full.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-evb8-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart7-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart7-m1-full.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart7-m2.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart8-m0.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart8-m0-full.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-hinlink-h68k.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-hinlink-h66k.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-uart8-m1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-hinlink-hnas.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-w1-gpio3-b3.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-iotest-ddr3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-w1-gpio4-b1.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/rk3588-hdmirx.dtbo
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-iotest-ddr3-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/overlay/README.rockchip-overlays
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nanopi5-rev01.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nanopi5-rev02.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nanopi5-rev03.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nanopi5-rev04.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nanopi5-rev05.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nanopi5-rev07.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nvr-demo-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nvr-demo-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nvr-demo-v10-linux-spi-nand.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nvr-demo-v12-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-nvr-demo-v12-linux-spi-nand.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-odroid-m1.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-radxa-e25.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-rock-3a.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-yy3568.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-toybrick-sd0-android.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-toybrick-sd0-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-toybrick-x0-android.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568-toybrick-x0-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-bananapi-m7.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blade3-v101-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blueberry-edge-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blueberry-edge-v12-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blueberry-edge-v12-maizhuo-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blueberry-edge-v14-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blueberry-minipc-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-blueberry-minipc-mizhuo-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-camera-csi-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-camera-dvp-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-dsi0-command2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-dsi0-command2lvds0-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-dsi0-command2rgb-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-dsi1-command2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-dsi1-command2lvds0-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-dsi1-command2rgb-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-rgb2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-rgb2lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-rgb2rgb-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-lvds2lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-evb-display-lvds2rgb-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi0-command2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi0-command2dual_lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi0-command2lvds0-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi0-dsi1-command2dual_lvdsx2-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi1-command2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi1-command2dual_lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-dsi1-command2lvds0-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-lvds2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-lvds2dual-lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-lvds2dual-lvds-vehicle-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-lvds2lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-lvds2rgb-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-rgb2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-rgb2dual-lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-rgb2dual-lvds-vehicle-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-rgb2lvds-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-rgb2rgb-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-super-frame-dsi0-command2dsi-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3568m-serdes-v1-evb-display-super-frame-dsi0-command2lvds0-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10-dsi-dsc-MV2100UZ1.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10-ipc-6x-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10-linux-amp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10-linux-ipc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb1-lp4-v10-lt6911uxe.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb2-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb2-lp4-v10-edp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb2-lp4-v10-edp2dp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb2-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb3-lp5-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb3-lp5-v10-edp.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb3-lp5-v10-edp-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb3-lp5-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb4-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb4-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb5-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb5-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb6-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb6-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb7-lp4-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb7-lp4-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb7-lp4-v10-rk1608-ipc-8x-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb7-lp4-v11-linux-ipc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb7-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-evb7-v11-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-firefly-itx-3588j.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-fxblox-rk1.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-hinlink-h88k.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-armsom-w3.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-armsom-sige7.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nanopc-cm3588-nas.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nanopc-t6.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo-v10-android.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo-v10-ipc-4x-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo-v10-spi-nand.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo1-v21.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo1-v21-android.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo3-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-nvr-demo3-v10-android.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-pcie-ep-demo-v11.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-pcie-ep-demo-v11-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-orangepi-5-plus.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-rock-5b.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-rock-5-itx.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-turing-rk1.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-mixtile-core3588e.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-toybrick-x0-android.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-toybrick-x0-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-vehicle-evb-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-vehicle-evb-v20.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-vehicle-evb-v21.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-vehicle-evb-v22.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588-vehicle-s66-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb1-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb1-lp4x-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb2-lp5-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb2-lp5-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb3-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb3-lp4x-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb3-lp4x-v10-nvp6158-ahd-to-bt1120.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb3-lp4x-v10-rk630-bt656-to-cvbs.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb3-lp4x-v10-sii9022-bt1120-to-hdmi.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb4-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb4-lp4x-v10-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-evb8-lp4x-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-9tripod-linux.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-khadas-edge2.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-lubancat-4.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-nanopi-r6c.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-nanopi-r6s.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-orangepi-5.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-orangepi-5b.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-orangepi-5-pro.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-radxa-cm5-io.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-radxa-nx5-io.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-rock-5a.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-roc-pc.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-tablet-rk806-single-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-tablet-v10.dtb
     INSTALL /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs/rockchip/rk3588s-tablet-v11.dtb
--> (33) INFO: Kernel built in [ 1 seconds - 5.10.160-rk35xx ]
--> (33) WARNING: Kernel DTB-only for development [ Copying preprocessed version of rockchip/rk3566-orangepi-3b.dtb ]
--> (33) COMMAND: cp -v /home/ukhan/build/cache/sources/linux-kernel-worktree/5.10__rk35xx__arm64/arch/arm64/boot/dts/rockchip/.rk3566-orangepi-3b.dtb.dts.tmp /home/ukhan/build/output/rockchip-rk3566-orangepi-3b.dtb--5.10-legacy.preprocessed.dts
--> (33) COMMAND: dtc -I dts -O dts -o /home/ukhan/build/output/rockchip-rk3566-orangepi-3b.dtb--5.10-legacy.preprocessed.normalized.dts /home/ukhan/build/output/rockchip-rk3566-orangepi-3b.dtb--5.10-legacy.preprocessed.dts
--> (33) WARNING: Kernel DTB-only for development [ Preprocessed FDT dest: /home/ukhan/build/output/rockchip-rk3566-orangepi-3b.dtb--5.10-legacy.preprocessed.dts ]
--> (33) WARNING: Kernel DTB-only for development [ Preprocessed FDT normalized: /home/ukhan/build/output/rockchip-rk3566-orangepi-3b.dtb--5.10-legacy.preprocessed.normalized.dts ]
--> (33) WARNING: Kernel DTB-only for development [ Preprocessed FDT normalized, no phandles: /home/ukhan/build/output/rockchip-rk3566-orangepi-3b.dtb--5.10-legacy.preprocessed.normalized.nophandles.dts ]
------------------------------------------------------------------------------------------------------------
### kernel_package.log 
--> (33) INFO: Packaging kernel [ rk35xx linux-rk35xx-legacy ]
--> (33) INFO: Kernel .deb package version [ 5.10.160-S709c-D53de-Pa8bc-Ce7edH5c21-HK01ba-Vc222-B3cfd-R448a ]
--> (33) COMMAND: rm -rf /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/image/boot/*.old
--> (33) INFO: Packaging linux-dtb [ rk35xx linux-rk35xx-legacy ]
--> (33) COMMAND: tree -C --du -h -L 2 /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs
   [ 52M]  /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs
   └── [ 52M]  rockchip
       ├── [3.1K]  overlay
       ├── [102K]  px30-evb-ddr3-v10-avb.dtb
       ├── [102K]  px30-evb-ddr3-v10.dtb
       ├── [101K]  px30-evb-ddr3-v10-linux.dtb
       ├── [102K]  px30-evb-ddr3-v11-linux.dtb
       ├── [102K]  px30-evb-ddr4-v10.dtb
       ├── [101K]  px30-evb-ddr4-v10-linux.dtb
       ├── [ 93K]  px30-evb.dtb
       ├── [102K]  px30-mini-evb-ddr3-v11-avb.dtb
       ├── [103K]  px30-mini-evb-ddr3-v11.dtb
       ├── [ 79K]  rk3308b-evb-amic-v10-amp.dtb
       ├── [ 78K]  rk3308b-evb-amic-v10.dtb
       ├── [ 78K]  rk3308bs-evb-amic-v11.dtb
       ├── [ 83K]  rk3308bs-evb-ddr3-v20-rk618-rgb2dsi.dtb
       ├── [ 79K]  rk3308bs-evb-dmic-pdm-v11.dtb
       ├── [ 81K]  rk3308bs-evb-mcu-display-v20.dtb
       ├── [ 84K]  rk3308bs-evb-mipi-display-v11.dtb
       ├── [ 81K]  rk3308bs-evb-rgb-display-v20.dtb
       ├── [ 79K]  rk3308-evb-amic-v11.dtb
       ├── [ 79K]  rk3308-evb-amic-v13.dtb
       ├── [ 80K]  rk3308-evb-dmic-pdm-v11.dtb
       ├── [ 80K]  rk3308-evb-dmic-pdm-v13.dtb
       ├── [ 67K]  rk3308-evb.dtb
       ├── [ 67K]  rk3308-roc-cc.dtb
       ├── [ 47K]  rk3318-a95x-z2.dtb
       ├── [102K]  rk3326-863-lp3-v10-avb.dtb
       ├── [101K]  rk3326-863-lp3-v10.dtb
       ├── [102K]  rk3326-863-lp3-v10-rkisp1.dtb
       ├── [103K]  rk3326-evb-lp3-v10-avb.dtb
       ├── [102K]  rk3326-evb-lp3-v10.dtb
       ├── [102K]  rk3326-evb-lp3-v10-linux.dtb
       ├── [104K]  rk3326-evb-lp3-v11-avb.dtb
       ├── [103K]  rk3326-evb-lp3-v11.dtb
       ├── [103K]  rk3326-evb-lp3-v12-linux.dtb
       ├── [ 92K]  rk3326-odroid-go2.dtb
       ├── [ 48K]  rk3328-a1.dtb
       ├── [ 47K]  rk3328-evb.dtb
       ├── [ 49K]  rk3328-nanopi-r2s.dtb
       ├── [ 49K]  rk3328-roc-cc.dtb
       ├── [ 49K]  rk3328-rock64.dtb
       ├── [100K]  rk3358-evb-ddr3-v10-linux.dtb
       ├── [101K]  rk3358m-vehicle-v10.dtb
       ├── [ 35K]  rk3368-evb-act8846.dtb
       ├── [ 34K]  rk3368-geekbox.dtb
       ├── [ 35K]  rk3368-lion-haikou.dtb
       ├── [ 34K]  rk3368-orion-r68-meta.dtb
       ├── [ 33K]  rk3368-px5-evb.dtb
       ├── [ 34K]  rk3368-r88.dtb
       ├── [ 79K]  rk3399-evb.dtb
       ├── [ 90K]  rk3399-ficus.dtb
       ├── [ 91K]  rk3399-firefly.dtb
       ├── [ 90K]  rk3399-gru-bob.dtb
       ├── [ 94K]  rk3399-gru-kevin.dtb
       ├── [ 91K]  rk3399-gru-scarlet-inx.dtb
       ├── [ 91K]  rk3399-gru-scarlet-kd.dtb
       ├── [ 90K]  rk3399-hugsun-x99.dtb
       ├── [ 91K]  rk3399-khadas-edge-captain.dtb
       ├── [ 90K]  rk3399-khadas-edge.dtb
       ├── [ 91K]  rk3399-khadas-edge-v.dtb
       ├── [ 87K]  rk3399-leez-p710.dtb
       ├── [ 91K]  rk3399-nanopc-t4.dtb
       ├── [ 90K]  rk3399-nanopi-m4.dtb
       ├── [ 90K]  rk3399-nanopi-neo4.dtb
       ├── [ 91K]  rk3399-orangepi.dtb
       ├── [ 96K]  rk3399-pinebook-pro.dtb
       ├── [ 86K]  rk3399pro-rock-pi-n10.dtb
       ├── [ 87K]  rk3399-puma-haikou.dtb
       ├── [ 89K]  rk3399-rock960.dtb
       ├── [ 88K]  rk3399-rock-pi-4a.dtb
       ├── [ 89K]  rk3399-rock-pi-4b.dtb
       ├── [ 89K]  rk3399-rock-pi-4c.dtb
       ├── [ 91K]  rk3399-rockpro64.dtb
       ├── [ 91K]  rk3399-rockpro64-v2.dtb
       ├── [ 91K]  rk3399-roc-pc.dtb
       ├── [ 92K]  rk3399-roc-pc-mezzanine.dtb
       ├── [ 90K]  rk3399-sapphire.dtb
       ├── [ 94K]  rk3399-sapphire-excavator.dtb
       ├── [109K]  rk3399-sapphire-excavator-edp-avb.dtb
       ├── [100K]  rk3528-demo1-lp4-v10.dtb
       ├── [100K]  rk3528-demo4-ddr4-v10.dtb
       ├── [100K]  rk3528-demo4-ddr4-v10-linux.dtb
       ├── [103K]  rk3528-demo6-ddr3-v10.dtb
       ├── [100K]  rk3528-evb1-ddr4-v10.dtb
       ├── [100K]  rk3528-evb1-ddr4-v10-linux.dtb
       ├── [100K]  rk3528-evb1-ddr4-v10-spi-nand-linux.dtb
       ├── [100K]  rk3528-evb2-ddr3-v10.dtb
       ├── [100K]  rk3528-evb3-lp4x-v10.dtb
       ├── [100K]  rk3528-evb4-ddr4-v10.dtb
       ├── [ 96K]  rk3528-hinlink-h28k.dtb
       ├── [ 98K]  rk3528-hinlink-ht2.dtb
       ├── [ 90K]  rk3528-iotest-lp3-v10.dtb
       ├── [ 98K]  rk3528-mangopi-m28k.dtb
       ├── [131K]  rk3562-dictpen-test3-v20.dtb
       ├── [137K]  rk3562-evb1-lp4x-v10.dtb
       ├── [138K]  rk3562-evb1-lp4x-v10-linux-amp.dtb
       ├── [137K]  rk3562-evb1-lp4x-v10-linux.dtb
       ├── [138K]  rk3562-evb1-lp4x-v10-lvds.dtb
       ├── [139K]  rk3562-evb1-lp4x-v10-mcu-k350c4516t.dtb
       ├── [138K]  rk3562-evb1-lp4x-v10-rgb2lvds.dtb
       ├── [138K]  rk3562-evb1-lp4x-v10-rgb-FX070-DHM11BOE-A.dtb
       ├── [139K]  rk3562-evb1-lp4x-v10-rgb-k350c4516t.dtb
       ├── [138K]  rk3562-evb1-lp4x-v10-sii9022-rgb2hdmi.dtb
       ├── [137K]  rk3562-evb1-lp4x-v10-spdif.dtb
       ├── [138K]  rk3562-evb2-ddr4-v10.dtb
       ├── [138K]  rk3562-evb2-ddr4-v10-dual-camera.dtb
       ├── [138K]  rk3562-evb2-ddr4-v10-image-reverse.dtb
       ├── [138K]  rk3562-evb2-ddr4-v10-linux.dtb
       ├── [138K]  rk3562-evb2-ddr4-v10-pdm-mic-array.dtb
       ├── [134K]  rk3562-evb2-ddr4-v10-sii9022-bt1120-to-hdmi.dtb
       ├── [126K]  rk3562-iotest-lp3-v10-dsm.dtb
       ├── [126K]  rk3562-iotest-lp3-v10.dtb
       ├── [121K]  rk3562-iotest-lp3-v10-linux.dtb
       ├── [120K]  rk3562j-core-ddr4-v10.dtb
       ├── [135K]  rk3562-rk817-tablet-v10.dtb
       ├── [132K]  rk3562-test1-ddr3-v10.dtb
       ├── [128K]  rk3562-test2-ddr4-v10.dtb
       ├── [155K]  rk3566-box-demo-v10.dtb
       ├── [172K]  rk3566-evb1-ddr4-v10.dtb
       ├── [172K]  rk3566-evb1-ddr4-v10-linux.dtb
       ├── [173K]  rk3566-evb1-ddr4-v10-lvds.dtb
       ├── [175K]  rk3566-evb2-lp4x-v10.dtb
       ├── [175K]  rk3566-evb2-lp4x-v10-edp.dtb
       ├── [179K]  rk3566-evb2-lp4x-v10-eink.dtb
       ├── [176K]  rk3566-evb2-lp4x-v10-i2s-mic-array.dtb
       ├── [174K]  rk3566-evb2-lp4x-v10-linux.dtb
       ├── [176K]  rk3566-evb2-lp4x-v10-pdm-mic-array.dtb
       ├── [173K]  rk3566-evb3-ddr3-v10.dtb
       ├── [172K]  rk3566-evb3-ddr3-v10-linux.dtb
       ├── [170K]  rk3566-evb5-lp4x-v10.dtb
       ├── [173K]  rk3566-evb-mipitest-v10.dtb
       ├── [167K]  rk3566-firefly-roc-pc.dtb
       ├── [162K]  rk3566-orangepi-3b.dtb
       ├── [155K]  rk3566-radxa-zero3-ap6212.dtb
       ├── [155K]  rk3566-radxa-zero3.dtb
       ├── [160K]  rk3566-rk817-eink.dtb
       ├── [163K]  rk3566-rk817-eink-w103.dtb
       ├── [161K]  rk3566-rk817-eink-w6.dtb
       ├── [163K]  rk3566-rk817-tablet.dtb
       ├── [164K]  rk3566-rk817-tablet-k108.dtb
       ├── [164K]  rk3566-rk817-tablet-rkg11.dtb
       ├── [163K]  rk3566-rk817-tablet-v10.dtb
       ├── [160K]  rk3566-taishanpi-v10.dtb
       ├── [176K]  rk3567-evb2-lp4x-v10.dtb
       ├── [177K]  rk3567-evb2-lp4x-v10-dual-channel-lvds.dtb
       ├── [177K]  rk3567-evb2-lp4x-v10-dual-lvds.dtb
       ├── [180K]  rk3568-evb1-ddr4-v10.dtb
       ├── [181K]  rk3568-evb1-ddr4-v10-dual-camera.dtb
       ├── [181K]  rk3568-evb1-ddr4-v10-linux-amp.dtb
       ├── [179K]  rk3568-evb1-ddr4-v10-linux.dtb
       ├── [179K]  rk3568-evb1-ddr4-v10-linux-spi-nor.dtb
       ├── [179K]  rk3568-evb2-lp4x-v10-bt1120-to-hdmi.dtb
       ├── [178K]  rk3568-evb2-lp4x-v10.dtb
       ├── [180K]  rk3568-evb4-lp3-v10.dtb
       ├── [181K]  rk3568-evb5-ddr4-v10.dtb
       ├── [179K]  rk3568-evb6-ddr3-v10.dtb
       ├── [179K]  rk3568-evb6-ddr3-v10-linux.dtb
       ├── [189K]  rk3568-evb6-ddr3-v10-rk628-bt1120-to-hdmi.dtb
       ├── [191K]  rk3568-evb6-ddr3-v10-rk628-rgb2dsi.dtb
       ├── [189K]  rk3568-evb6-ddr3-v10-rk628-rgb2hdmi.dtb
       ├── [190K]  rk3568-evb6-ddr3-v10-rk628-rgb2lvds.dtb
       ├── [180K]  rk3568-evb6-ddr3-v10-rk630-bt656-to-cvbs.dtb
       ├── [180K]  rk3568-evb7-ddr4-v10.dtb
       ├── [180K]  rk3568-evb8-lp4-v10.dtb
       ├── [179K]  rk3568-evb8-lp4-v10-linux.dtb
       ├── [163K]  rk3568-hinlink-h66k.dtb
       ├── [164K]  rk3568-hinlink-h68k.dtb
       ├── [167K]  rk3568-hinlink-hnas.dtb
       ├── [174K]  rk3568-iotest-ddr3-v10.dtb
       ├── [148K]  rk3568-iotest-ddr3-v10-linux.dtb
       ├── [176K]  rk3568m-serdes-evb-camera-csi-v10.dtb
       ├── [176K]  rk3568m-serdes-evb-camera-dvp-v10.dtb
       ├── [177K]  rk3568m-serdes-evb-display-dsi0-command2dsi-lp4x-v10.dtb
       ├── [175K]  rk3568m-serdes-evb-display-dsi0-command2lvds0-lp4x-v10.dtb
       ├── [175K]  rk3568m-serdes-evb-display-dsi0-command2rgb-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-evb-display-dsi1-command2dsi-lp4x-v10.dtb
       ├── [175K]  rk3568m-serdes-evb-display-dsi1-command2lvds0-lp4x-v10.dtb
       ├── [175K]  rk3568m-serdes-evb-display-dsi1-command2rgb-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-evb-display-lvds2lvds-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-evb-display-lvds2rgb-lp4x-v10.dtb
       ├── [178K]  rk3568m-serdes-evb-display-rgb2dsi-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-evb-display-rgb2lvds-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-evb-display-rgb2rgb-lp4x-v10.dtb
       ├── [178K]  rk3568m-serdes-v1-evb-display-dsi0-command2dsi-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-v1-evb-display-dsi0-command2dual_lvds-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-v1-evb-display-dsi0-command2lvds0-lp4x-v10.dtb
       ├── [176K]  rk3568m-serdes-v1-evb-display-dsi0-dsi1-command2dual_lvdsx2-lp4x-v10.dtb
       ├── [178K]  rk3568m-serdes-v1-evb-display-dsi1-command2dsi-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-v1-evb-display-dsi1-command2dual_lvds-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-v1-evb-display-dsi1-command2lvds0-lp4x-v10.dtb
       ├── [181K]  rk3568m-serdes-v1-evb-display-lvds2dsi-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-lvds2dual-lvds-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-lvds2dual-lvds-vehicle-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-lvds2lvds-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-lvds2rgb-lp4x-v10.dtb
       ├── [181K]  rk3568m-serdes-v1-evb-display-rgb2dsi-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-rgb2dual-lvds-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-rgb2dual-lvds-vehicle-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-rgb2lvds-lp4x-v10.dtb
       ├── [179K]  rk3568m-serdes-v1-evb-display-rgb2rgb-lp4x-v10.dtb
       ├── [178K]  rk3568m-serdes-v1-evb-display-super-frame-dsi0-command2dsi-lp4x-v10.dtb
       ├── [177K]  rk3568m-serdes-v1-evb-display-super-frame-dsi0-command2lvds0-lp4x-v10.dtb
       ├── [167K]  rk3568-nanopi5-rev01.dtb
       ├── [165K]  rk3568-nanopi5-rev02.dtb
       ├── [165K]  rk3568-nanopi5-rev03.dtb
       ├── [165K]  rk3568-nanopi5-rev04.dtb
       ├── [167K]  rk3568-nanopi5-rev05.dtb
       ├── [168K]  rk3568-nanopi5-rev07.dtb
       ├── [160K]  rk3568-nvr-demo-v10.dtb
       ├── [160K]  rk3568-nvr-demo-v10-linux.dtb
       ├── [160K]  rk3568-nvr-demo-v10-linux-spi-nand.dtb
       ├── [160K]  rk3568-nvr-demo-v12-linux.dtb
       ├── [160K]  rk3568-nvr-demo-v12-linux-spi-nand.dtb
       ├── [173K]  rk3568-odroid-m1.dtb
       ├── [164K]  rk3568-radxa-e25.dtb
       ├── [169K]  rk3568-rock-3a.dtb
       ├── [179K]  rk3568-toybrick-sd0-android.dtb
       ├── [179K]  rk3568-toybrick-sd0-linux.dtb
       ├── [182K]  rk3568-toybrick-x0-android.dtb
       ├── [181K]  rk3568-toybrick-x0-linux.dtb
       ├── [167K]  rk3568-yy3568.dtb
       ├── [262K]  rk3588-armsom-sige7.dtb
       ├── [266K]  rk3588-armsom-w3.dtb
       ├── [262K]  rk3588-bananapi-m7.dtb
       ├── [261K]  rk3588-blade3-v101-linux.dtb
       ├── [261K]  rk3588-blueberry-edge-v10-linux.dtb
       ├── [262K]  rk3588-blueberry-edge-v12-linux.dtb
       ├── [262K]  rk3588-blueberry-edge-v12-maizhuo-linux.dtb
       ├── [265K]  rk3588-blueberry-edge-v14-linux.dtb
       ├── [260K]  rk3588-blueberry-minipc-linux.dtb
       ├── [260K]  rk3588-blueberry-minipc-mizhuo-linux.dtb
       ├── [283K]  rk3588-evb1-lp4-v10-dsi-dsc-MV2100UZ1.dtb
       ├── [284K]  rk3588-evb1-lp4-v10.dtb
       ├── [290K]  rk3588-evb1-lp4-v10-ipc-6x-linux.dtb
       ├── [284K]  rk3588-evb1-lp4-v10-linux-amp.dtb
       ├── [283K]  rk3588-evb1-lp4-v10-linux.dtb
       ├── [281K]  rk3588-evb1-lp4-v10-linux-ipc.dtb
       ├── [286K]  rk3588-evb1-lp4-v10-lt6911uxe.dtb
       ├── [280K]  rk3588-evb2-lp4-v10.dtb
       ├── [278K]  rk3588-evb2-lp4-v10-edp2dp.dtb
       ├── [279K]  rk3588-evb2-lp4-v10-edp.dtb
       ├── [277K]  rk3588-evb2-lp4-v10-linux.dtb
       ├── [285K]  rk3588-evb3-lp5-v10.dtb
       ├── [283K]  rk3588-evb3-lp5-v10-edp.dtb
       ├── [282K]  rk3588-evb3-lp5-v10-edp-linux.dtb
       ├── [284K]  rk3588-evb3-lp5-v10-linux.dtb
       ├── [269K]  rk3588-evb4-lp4-v10.dtb
       ├── [268K]  rk3588-evb4-lp4-v10-linux.dtb
       ├── [273K]  rk3588-evb5-lp4-v10.dtb
       ├── [273K]  rk3588-evb5-lp4-v10-linux.dtb
       ├── [277K]  rk3588-evb6-lp4-v10.dtb
       ├── [277K]  rk3588-evb6-lp4-v10-linux.dtb
       ├── [276K]  rk3588-evb7-lp4-v10.dtb
       ├── [275K]  rk3588-evb7-lp4-v10-linux.dtb
       ├── [289K]  rk3588-evb7-lp4-v10-rk1608-ipc-8x-linux.dtb
       ├── [273K]  rk3588-evb7-lp4-v11-linux-ipc.dtb
       ├── [278K]  rk3588-evb7-v11.dtb
       ├── [277K]  rk3588-evb7-v11-linux.dtb
       ├── [267K]  rk3588-firefly-itx-3588j.dtb
       ├── [265K]  rk3588-fxblox-rk1.dtb
       ├── [260K]  rk3588-hinlink-h88k.dtb
       ├── [257K]  rk3588-mixtile-core3588e.dtb
       ├── [265K]  rk3588-nanopc-cm3588-nas.dtb
       ├── [264K]  rk3588-nanopc-t6.dtb
       ├── [262K]  rk3588-nvr-demo1-v21-android.dtb
       ├── [261K]  rk3588-nvr-demo1-v21.dtb
       ├── [261K]  rk3588-nvr-demo3-v10-android.dtb
       ├── [260K]  rk3588-nvr-demo3-v10.dtb
       ├── [258K]  rk3588-nvr-demo-v10-android.dtb
       ├── [258K]  rk3588-nvr-demo-v10.dtb
       ├── [266K]  rk3588-nvr-demo-v10-ipc-4x-linux.dtb
       ├── [258K]  rk3588-nvr-demo-v10-spi-nand.dtb
       ├── [268K]  rk3588-orangepi-5-plus.dtb
       ├── [258K]  rk3588-pcie-ep-demo-v11.dtb
       ├── [258K]  rk3588-pcie-ep-demo-v11-linux.dtb
       ├── [263K]  rk3588-rock-5b.dtb
       ├── [263K]  rk3588-rock-5-itx.dtb
       ├── [233K]  rk3588s-9tripod-linux.dtb
       ├── [256K]  rk3588s-evb1-lp4x-v10.dtb
       ├── [255K]  rk3588s-evb1-lp4x-v10-linux.dtb
       ├── [244K]  rk3588s-evb2-lp5-v10.dtb
       ├── [243K]  rk3588s-evb2-lp5-v10-linux.dtb
       ├── [242K]  rk3588s-evb3-lp4x-v10.dtb
       ├── [241K]  rk3588s-evb3-lp4x-v10-linux.dtb
       ├── [243K]  rk3588s-evb3-lp4x-v10-nvp6158-ahd-to-bt1120.dtb
       ├── [242K]  rk3588s-evb3-lp4x-v10-rk630-bt656-to-cvbs.dtb
       ├── [243K]  rk3588s-evb3-lp4x-v10-sii9022-bt1120-to-hdmi.dtb
       ├── [240K]  rk3588s-evb4-lp4x-v10.dtb
       ├── [240K]  rk3588s-evb4-lp4x-v10-linux.dtb
       ├── [246K]  rk3588s-evb8-lp4x-v10.dtb
       ├── [230K]  rk3588s-khadas-edge2.dtb
       ├── [233K]  rk3588s-lubancat-4.dtb
       ├── [226K]  rk3588s-nanopi-r6c.dtb
       ├── [227K]  rk3588s-nanopi-r6s.dtb
       ├── [239K]  rk3588s-orangepi-5b.dtb
       ├── [239K]  rk3588s-orangepi-5.dtb
       ├── [235K]  rk3588s-orangepi-5-pro.dtb
       ├── [228K]  rk3588s-radxa-cm5-io.dtb
       ├── [225K]  rk3588s-radxa-nx5-io.dtb
       ├── [227K]  rk3588s-rock-5a.dtb
       ├── [231K]  rk3588s-roc-pc.dtb
       ├── [238K]  rk3588s-tablet-rk806-single-v10.dtb
       ├── [247K]  rk3588s-tablet-v10.dtb
       ├── [240K]  rk3588s-tablet-v11.dtb
       ├── [278K]  rk3588-toybrick-x0-android.dtb
       ├── [273K]  rk3588-toybrick-x0-linux.dtb
       ├── [257K]  rk3588-turing-rk1.dtb
       ├── [293K]  rk3588-vehicle-evb-v10.dtb
       ├── [295K]  rk3588-vehicle-evb-v20.dtb
       ├── [317K]  rk3588-vehicle-evb-v21.dtb
       ├── [322K]  rk3588-vehicle-evb-v22.dtb
       └── [288K]  rk3588-vehicle-s66-v10.dtb
   
     52M used in 2 directories, 310 files
--> (33) COMMAND: cp -rp /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/kernel_dest_install_dir-dHtVi/dtbs /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO/boot/dtb-5.10.160-legacy-rk35xx
--> (33) COMMAND: cat /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO/DEBIAN/preinst
--> (33) COMMAND: cat /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO/DEBIAN/postinst
--> (33) COMMAND: chown -R root:root /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO
--> (33) COMMAND: chmod -R go-w /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO
--> (33) COMMAND: chmod -R a+rX /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO
--> (33) COMMAND: chmod -R ug-s /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO
--> (33) INFO: shellcheck found no problems in package scripts [ shellchecked 2 scripts in 'linux-dtb-legacy-rk35xx' ]
--> (33) INFO: Building package, this might take a while.. [ linux-dtb-legacy-rk35xx_5.10.160-S709c-D53de-Pa8bc-Ce7edH5c21-HK01ba-Vc222-B3cfd-R448a_arm64.deb ]
--> (33) COMMAND: dpkg-deb -b -Znone /home/ukhan/build/.tmp/work-6fa0febe-ed3c-4f7f-84db-59d7574b323c/deb-k-linux-dtb-legacy-rk35xx-iaSTO /home/ukhan/build/output/packages-hashed/global/linux-dtb-legacy-rk35xx_5.10.160-S709c-D53de-Pa8bc-Ce7edH5c21-HK01ba-Vc222-B3cfd-R448a_arm64.deb
   dpkg-deb: building package 'linux-dtb-legacy-rk35xx' in '/home/ukhan/build/output/packages-hashed/global/linux-dtb-legacy-rk35xx_5.10.160-S709c-D53de-Pa8bc-Ce7edH5c21-HK01ba-Vc222-B3cfd-R448a_arm64.deb'.
--> (33) INFO: Kernel packaged in [ 0 seconds - 5.10.160-rk35xx ]
------------------------------------------------------------------------------------------------------------
### runtime_total.log 
--> (33) INFO: Runtime [ 0:33 min ]
------------------------------------------------------------------------------------------------------------
### repeat_build_options.log 
--> (33) EXT: Repeat Build Options [ ./compile.sh kernel-dtb BOARD=orangepi3b BRANCH=legacy IGNORE_UPDATES=yes ]
--> (33) INFO: Cleaning up [ please wait for cleanups to finish ]
------------------------------------------------------------------------------------------------------------

```

