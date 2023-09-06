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
yum -y install rsync sed ed tcl.ppc tcl.ppc64 tcl-devel.ppc tcl-devel.ppc64 tk.ppc tk.ppc64 tk-devel.ppc tk-devel.ppc64 wget expat.ppc expat.ppc64 expat-devel.ppc expat-devel.ppc64 glibc.ppc glibc-devel.ppc glibc.ppc64 glibc-devel.ppc64 glibc-headers glibc-static.ppc glibc-static.ppc64 libstdc++.ppc libstdc++-devel.ppc libstdc++.ppc64 libstdc++-devel.ppc64 elfspe2 netpbm.ppc netpbm-devel.ppc netpbm.ppc64 netpbm-devel.ppc64 numactl.ppc numactl-devel.ppc numactl.ppc64 numactl-devel.ppc64 libspe2.ppc libspe2.ppc64 libspe2-adabinding-devel libspe2-devel.ppc libspe2-devel.ppc64 libspe2-manpages
#alf-compat alf-spu-trace-devel alf-trace-devel alfxds alfxds-devel cell-spu-isolation-devel dacs-compat dacs-trace-devel fdpr-launcher libfft-devel libfft3d-devel libmc-rand-devel pdt-devel ppu-mass-compat spu-timer-devel trace-devel alf-ide-template cell-spu-isolation-tool-source cell-xlc-ssc-cmp cell-xlc-ssc-help cell-xlc-ssc-lib cell-xlc-ssc-man cell-xlc-ssc-omp cell-xlc-ssc-rte cell-xlc-ssc-rte-lnk dacs-tools ppu-gcc-fortran ppu-gcc-gnat ppu-gcc43 ppu-gcc43-c++ ppu-gcc43-fortran spu-gcc-fortran spu-gcc43 spu-gcc43-c++ spu-gcc43-fortran alfxds-examples-source cell-compliance-tests cell-compliance-tests-source libfft-examples-source libfft3d-examples-source cell-spu-isolation-loader datamover-pcie-axon libfft libfft3d alf-trace cell-spu-timing cellperfctr-driver cellperfctr-tools dacs-trace fdprpro pdt pdtr trace blas-devel.ppc blas-devel.ppc64

printf "\nNew service (elfspe2) installed.\nREBOOT!\n\n"

exit 0

