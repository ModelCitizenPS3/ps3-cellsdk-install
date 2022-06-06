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
cp -v rpm-gpg/RPM-GPG-KEY-cellsdk /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk
cp -v rpm-gpg/RPM-GPG-KEY-cellsdk-open /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk-open
cp -v yum.repos.d/cellsdk-RHEL.repo /etc/yum.repos.d/cellsdk-RHEL.repo

yum clean all
yum makecache

yum -y install numactl.ppc numactl.ppc64 numactl-devel.ppc numactl-devel.ppc64 netpbm-devel rsync sed tcl glibc-devel.ppc64
yum -y groupinstall "Cell Runtime Environment" "Cell Development Tools" "Cell Development Libraries" "Cell Programming Examples"
yum -y install alf-trace cell-spu-timing cellperfctr-driver cellperfctr-tools dacs-trace fdprpro trace blas blas-devel elfspe2 lapack lapack-devel libspe2 oprofile oprofile-devel libspe2-devel.ppc libspe2-devel.ppc64

printf "\nREBOOT\n\n"

