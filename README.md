# ps3-cellsdk-install

Script to install Cell SDK 3.0 in Fedora 12 (ppc) on Playstation 3 (OtherOS)

## IMPORTANT - BEFORE INSTALLING

- Before running **ps3-cellsdk-install.sh** make sure your standard yum repos (Fedora 12 and Fedora 12 Updates) are properly configured and working
- SCRIPT ASSUMES STANDARD FEDORA 12 (ppc) YUM REPOS ARE FUNCTIONING AND INSTALLS SOME PACKAGES FROM THEM
- If your Fedora 12 repos are NOT set up, clone my other github repo [ps3-goodrepos](https://github.com/ModelCitizenPS3/ps3-goodrepos) and run that script first
- Before installing the Cell SDK you should set up and activate your spu file system - instructions follow

## SPU FILE SYSTEM SETUP/ACTIVATION
1. Create a directory for mounting of SPU file system: `sudo mkdir /spu`
2. Add this line to your **/etc/fstab** file: `spufs /spu spufs defaults 0 0`
3. Remount all fstab entries and make sure theres no errors: `sudo mount -a`

## INSTRUCTIONS
1. Clone repo: `git clone https://github.com/ModelCitizenPS3/ps3-cellsdk-install.git`
2. Copy repo dir **ps3-cellsdk-install** to Fedora 12 (ppc) installation on Playstation 3 (OtherOS) - home directory is fine
3. Enter repo dir: `cd ps3-cellsdk-install/`
4. Run script with root privileges: `sudo ./ps3-cellsdk-install.sh`
5. Reboot PS3 (a new service got installed - **elfspe2** - allows you to run SPU programs from command prompt)
6. Look in `/opt/cell` for (most) Cell SDK content - happy SPUing

## NOTES
This version of the Cell SDK (3.0) was designed for installation on an earlier Fedora release (9, specifically), but it works fine in Fedora 12 (ppc) with no/minimal headaches.

The default Cell SDK 3.0 install script contained in package **cell-install-3.0.0-1.0.noarch.rpm** from the Cell SDK 3.0 install repositories (hosted at [ps3linux.net/cellsdk-repos](http://www.ps3linux.net/cellsdk-repos)) uses yum to install sets of packages from the Cell SDK 3.0 repos but is wonky in Fedora 12. My script **ps3-cellsdk-install.sh** does the same thing and was developed using the Cell SDK 3.0 install documentation (and my own experience using the SDK on the PS3).

The online Cell SDK 3.0 repos used by this script are hosted by myself on my own jailbroke Playstation 3 Linux web server: [ps3linux.net](http://www.ps3linux.net). Yes, I bought my PS3 its own domain... and its up 24/7... you're welcome :-)

If online Cell SDK repos are down/unreachable I'm probably just using my PS3 for gaming (can't run Apache in GameOS) - sorry! Try running script again later.

### The Model Citizen

