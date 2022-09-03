#!/bin/bash
#
# Script to install IBM Cell SDk (RHEL) 3.1 in Fedora 12 (ppc64) on Playstation 3.
# Adds a new repo config (with RPM-GPG-KEY files) to yum package manager config dirs, then has yum rebuild its cache.
# Installs most packages from the CellSDK repos (I developed this script from the SDK install manual for a pretty complete install).
# Script assumes yum is already configured with (functioning) standard Fedora 12 repos!!!
# Use my other script at https://github.com/ModelCitizenPS3/ps3-goodrepos to configure Fedora 12 repos on your system first, if needed.
# Make sure your spu file system is set up in your /etc/fstab file before installing. See README.md for details.
# Most of the SDK (except for the binaries like spu-gcc, etc) install in /opt so look there after install.
# If Eclipse is installed, you may want to also install package cellide at some point. Its like a cell programming add-on for Eclipse.
# CellSDK repos are hosted by me on my own Playstation 3 web server (ps3linux.net).
# Pretty sure my PS3 is the only place in the world these repos are actively hosted so... you're welcome :-)
# If yum cannot connect to CellSDK repos don't panic. I'm probably just playing Uncharted; try back later.
# Alternatively it could mean my PS3 finally died... in which case PANIC!
# I do have a patreon: patreon.com/ModelCitizenPS3
# Consider helping me keep PS3 Linux and Cell programming alive and accessible (and maybe purchase a backup PS3 in case mine shits the bed).
# Happy SPUing!
#
# RUN AS ROOT
#
if [ $(id -u) != 0 ]; then
    printf "Please run script as root.\n"
    exit 1
fi

cp -v rpm-gpg/RPM-GPG-KEY-cellsdk /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk
cp -v rpm-gpg/RPM-GPG-KEY-cellsdk-open /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk-open
cp -v yum.repos.d/cellsdk.repo /etc/yum.repos.d/cellsdk.repo

yum clean all
yum makecache

yum -y install numactl.ppc numactl.ppc64 numactl-devel.ppc numactl-devel.ppc64 netpbm-devel rsync sed tcl glibc.ppc glibc.ppc64 glibc-devel.ppc glibc-devel.ppc64 libspe2.ppc libspe2.ppc64 libspe2-devel.ppc libspe2-devel.ppc64 libspe2-manpages oprofile oprofile-devel elfspe2 ppu-binutils ppu-gcc ppu-gcc-c++ ppu-gcc-fortran ppu-gdb ppu-gcc-gnat spu-binutils spu-gcc spu-gcc-c++ spu-gcc-fortran spu-gdb spu-newlib spu-newlib-manpages cell-documentation cell-extras-documentation cell-spu-timing cellperfctr-driver cellperfctr-tools fdprpro trace cell-buildutils cell-demos cell-demos-source cell-examples cell-examples-source cell-libs cell-libs-devel cell-libs-source cell-tutorial cell-tutorial-source cell-compliance-tests cell-compliance-tests-source

printf "\nREBOOT\n\n"

exit 0

