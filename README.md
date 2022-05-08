# ps3-cellsdk-install

Script to install Cell SDK (RHEL) 3.1 in Fedora 12 (ppc) on Playstation 3 (OtherOS)

## IMPORTANT - BEFORE INSTALLING

- Before running cellsdk install script, make sure your standard yum repos (Fedora 12 ppc, and Fedora 12 Updates ppc) are properly configured and working. Script assumes yum Fedora 12 repos are functioning and installs some packages from them. If your Fedora 12 repos are NOT set up, clone my other github repo (https://github.com/ModelCitizenPS3/ps3-goodrepos) and run that script first! It will connect you to working Fedora 12 repos.
- Before installing the Cell SDK you should set up and activate your spu file system (required for the Cell's spu cores to work). Instructions follow.

## SPU FILE SYSTEM SETUP/ACTIVATION
1. Create a directory for mounting of SPU file system: `sudo mkdir /spu`
2. Add this line to your /etc/fstab file: `spufs /spu spufs defaults 0 0`
3. Remount all fstab entries and make sure theres no errors: `sudo mount -a`

## INSTRUCTIONS
1. Clone repo (may not work in Fedora 12 - SSL certs): `git clone https://github.com/ModelCitizenPS3/ps3-cellsdk-install.git`
2. Copy repo dir to Fedora 12 ppc on your phat Playstation 3 (OtherOS). Your home folder is fine.
3. Enter repo dir: `cd ps3-cellsdk-install/`
4. Run script with root privileges: `sudo ./ps3-cellsdk-install.sh`
5. Reboot PS3 (a new service got installed - will start after reboot).

## NOTES
This version of the Cell SDK (the latest I could find) was designed for installation on a Red Hat system (not Fedora). Fedora 12 is also a marginally later distro than the one the Cell SDK was designed for. Luckily, as I've found, this fact only breaks the default SDK installer (cell-install-3.1.0-0.0.noarch.rpm) so don't bother with that package. Its really just a script that connects yum to the SDK repos, then tells yum what to install from them (exactly what my script does!). Luckily Fedora and Red Hat are basically identical distros, so all the rpm packages from this Cell SDK will install and work flawlessly with no issues. I've tested them all.

There are Fedora-specific versions of the Cell SDK available but they are earlier releases (and designed for earlier Fedoras, like Fedora 9). Anyway this version of the SDK is the latest available, and it works great on Fedora 12 :-)

