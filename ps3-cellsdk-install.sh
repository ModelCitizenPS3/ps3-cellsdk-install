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
cp -fv yum.repos.d/ps3linux.repo /etc/yum.repos.d/ps3linux.repo

yum clean all
yum makecache

yum -y groupinstall "Cell Development Libraries" "Cell Development Tools" "Cell Programming Examples" "Cell Runtime Environment"
yum -y install rsync wget sed ed expat expat-devel glibc.ppc glibc.ppc64 glibc-devel.ppc glibc-devel.ppc64 glibc-headers glibc-static.ppc glibc-static.ppc64 glibc-utils libstdc++.ppc libstdc++.ppc64 libstdc++-devel.ppc libstdc++-devel.ppc64 libspe2.ppc libspe2.ppc64 libspe2-adabinding-devel libspe2-devel.ppc libspe2-devel.ppc64 libspe2man netpbm.ppc netpbm.ppc64 netpbm-devel.ppc netpbm-devel.ppc64 numactl.ppc numactl.ppc64 numactl-devel.ppc numactl-devel.ppc64 tcl.ppc tcl.ppc64 tcl-devel.ppc tcl-devel.ppc64 tk.ppc tk.ppc64 tk-devel.ppc tk-devel.ppc64 elfspe2 cellperfctr-driver ppu-gcc-fortran ppu-gcc-gnat spu-gcc-fortran cell-spu-timing cellperfctr-tools cell-xlc-ssc-cmp cell-xlc-ssc-help cell-xlc-ssc-lib cell-xlc-ssc-man cell-xlc-ssc-omp cell-xlc-ssc-rte cell-xlc-ssc-rte-lnk pdt pdt-devel pdtr trace trace-devel spu-timer-devel libmc-rand-devel libfft libfft-devel libfft-examples-source fdprpro cell-compliance-tests cell-compliance-tests-source alf-trace alf-trace-devel compat-libstdc++-33.ppc compat-libstdc++-33.ppc64 sudo yum install alf.ppc64 alf-devel.ppc64 alf-trace.ppc64 alf-trace-devel.ppc64 blas.ppc64 blas-devel.ppc64 cell-libs-devel.ppc64 dacs-trace.ppc64 dacs-trace-devel.ppc64 ppu-mass-devel.ppc64 ppu-simdmath.ppc64 ppu-simdmath-devel.ppc64 trace.ppc64 pdt-devel.ppc64 libgfortran.ppc libgfortran.ppc64

printf "\nNew service (elfspe2) installed.\nREBOOT!\n\n"

exit 0

