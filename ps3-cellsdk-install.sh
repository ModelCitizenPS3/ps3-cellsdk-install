#!/bin/bash
#
# Script to install the Cell Braodband Engine (Cell/B.E.) Software Development Kit (SDK)
# To be run on a Fedora 12 (ppc) Linux system such as a Playstation 3 (with firmware <= 3.15) under OtherOS
#
# RUN AS ROOT

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
yum -y install rsync wget sed ed imake gdb-gdbserver tcl.ppc tcl.ppc64 tcl-devel.ppc tcl-devel.ppc64 tk.ppc tk.ppc64 tk-devel.ppc tk-devel.ppc64 elfspe2 libspe2.ppc libspe2.ppc64 libspe2-devel.ppc libspe2-devel.ppc64 netpbm.ppc netpbm.ppc64 netpbm-devel.ppc netpbm-devel.ppc64 cell-xlc-ssc-cmp cell-xlc-ssc-help cell-xlc-ssc-lib cell-xlc-ssc-man cell-xlc-ssc-omp cell-xlc-ssc-rte cell-xlc-ssc-rte-lnk dacs-tools ppu-gcc-fortran ppu-gcc-gnat spu-gcc-fortran cell-spu-timing cellperfctr-driver cellperfctr-tools fdprpro pdt.ppc pdt.ppc64 cell-libs.ppc cell-libs.ppc64 cell-libs-devel.ppc cell-libs-devel.ppc64 numactl.ppc numactl.ppc64 numactl-devel.ppc numactl-devel.ppc64 blas.ppc blas.ppc64 blas-devel.ppc blas-devel.ppc64 blas-examples-source blas-manpages lapack.ppc lapack.ppc64 lapack-devel.ppc lapack-devel.ppc64 lapack-examples-source alf-compat.ppc alf-compat.ppc64 alf-devel.ppc alf-devel.ppc64 alfman alf-spu-trace-devel alf-trace-devel.ppc alf-trace-devel.ppc64 alf-trace.ppc alf-trace.ppc64 alf-ide-template ppu-gcc43-fortran spu-gcc43-fortran ppu-gcc43 spu-gcc43 libspe2-adabinding-devel.ppc64 gdb-gdbserver ibm-java2-ppc-jre alf.ppc64 cell-compliance-tests.ppc64 cell-compliance-tests-source dacs.ppc64 dacs-trace.ppc64 dacs-trace-devel.ppc dacs-trace-devel.ppc64 pdt-devel.ppc pdt-devel.ppc64 trace.ppc trace-devel.ppc trace-devel.ppc64 pdtr.ppc64 ppu-mass-devel.ppc64 ppu-simdmath.ppc64 ppu-simdmath-devel.ppc64

printf "\nCell SDK install complete! Thank your for running my script :-)\n\nNOTE:\nYou should add 'export CELL_TOP=/opt/cell/sdk' to your .bashrc file.\nAlso, new service (elfspe2) has been installed. Reboot to enable.\n\n"

exit 0

