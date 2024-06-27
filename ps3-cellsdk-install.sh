#!/bin/bash
#
# RUN AS ROOT - Happy SPUing!
#

if [ $(id -u) != 0 ]; then
    printf "Please run as root.\n"
    exit 1
fi

cp -fv rpm-gpg/RPM-GPG-KEY-cellsdk /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk
cp -fv rpm-gpg/RPM-GPG-KEY-cellsdk-open /etc/pki/rpm-gpg/RPM-GPG-KEY-cellsdk-open
cp -fv yum.repos.d/cellsdk.repo /etc/yum.repos.d/cellsdk.repo

yum clean all
yum makecache

yum -y groupinstall "Cell Development Libraries" "Cell Development Tools" "Cell Programming Examples" "Cell Runtime Environment"
yum -y install rsync wget tcl sed ed gdb-gdbserver elfspe2 libspe2.ppc libspe2.ppc64 libspe2-devel.ppc libspe2-devel.ppc64 netpbm.ppc netpbm.ppc64 netpbm-devel.ppc netpbm-devel.ppc64 alf-ide-template cell-xlc-ssc-cmp cell-xlc-ssc-help cell-xlc-ssc-lib cell-xlc-ssc-man cell-xlc-ssc-omp cell-xlc-ssc-rte cell-xlc-ssc-rte-lnk dacs-tools ppu-gcc-fortran ppu-gcc-gnat spu-gcc-fortran cell-spu-timing cellperfctr-driver cellperfctr-tools fdprpro pdt cell-libs.ppc cell-libs.ppc64 cell-libs-devel.ppc cell-libs-devel.ppc64

printf "\nNew service (elfspe2) installed.\nYou should reboot.\n\n"

exit 0

