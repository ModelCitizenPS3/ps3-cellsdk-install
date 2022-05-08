#!/bin/bash
#
# Script to install IBM Cell SDk (RHEL) 3.1 in Fedora 12 (ppc) on Playstation 3.
#
cp -v rpm.gpg/RPM-GPG-KEY-cellsdk /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk
cp -v rpm.gpg/RPM-GPG-KEY-cellsdk-open /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk-open
cp -v yum.repos.d/cellsdk-RHEL.repo /etc/yum.repos.d/cellsdk-RHEL.repo

yum clean all
yum makecache

yum -y install numactl.ppc numactl.ppc64 numactl-devel.ppc numactl-devel.ppc64 netpbm-devel rsync sed tcl glibc-devel.ppc64
yum -y groupinstall "Cell Runtime Environment" "Cell Development Tools" "Cell Development Libraries" "Cell Programming Examples"
yum -y install alf-trace cell-spu-timing cellperfctr-driver cellperfctr-tools dacs-trace fdprpro trace blas blas-devel elfspe2 lapack lapack-devel libspe2 oprofile oprofile-devel libspe2-adabinding-devel alf-compat.ppc alf-compat.ppc64 dacs-compat.ppc64 ppu-mass-compat.ppc64 libspe2-devel.ppc libspe2-devel.ppc64

printf "\nREBOOT\n\n"

