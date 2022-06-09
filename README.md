# ps3-cellsdk-install

Script to install Cell SDK (RHEL) 3.1.0.0.0 in Fedora 12 (ppc64) on Playstation 3 (OtherOS)

## IMPORTANT - BEFORE INSTALLING

- Before running **ps3-cellsdk-install.sh** make sure your standard yum repo(s) Fedora 12 ppc / Fedora 12 Updates ppc are properly configured and working
- SCRIPT ASSUMES STANDARD FEDORA 12 (ppc64) YUM REPOS ARE FUNCTIONING AND INSTALLS SOME PACKAGES FROM THEM
- If your Fedora 12 repos are NOT set up, clone my other github repo [ps3-goodrepos](https://github.com/ModelCitizenPS3/ps3-goodrepos) and run that script first
- Before installing the Cell SDK you should set up and activate your spu file system (required for the Cell's spu cores to work) - instructions follow

## SPU FILE SYSTEM SETUP/ACTIVATION
1. Create a directory for mounting of SPU file system: `sudo mkdir /spu`
2. Add this line to your **/etc/fstab** file: `spufs /spu spufs defaults 0 0`
3. Remount all fstab entries and make sure theres no errors: `sudo mount -a`

## INSTRUCTIONS
1. Clone repo: `git clone https://github.com/ModelCitizenPS3/ps3-cellsdk-install.git`
2. Copy repo dir **ps3-cellsdk-install** to Fedora 12 (ppc64) installation on Playstation 3 (OtherOS) - home directory is fine
3. Enter repo dir: `cd ps3-cellsdk-install/`
4. Run script with root privileges: `sudo ./ps3-cellsdk-install.sh`
5. Reboot PS3 (a new service got installed - **elfspe2** - allows you to run SPU programs from command prompt)
6. Look in `/opt/cell` for (non-binary) Cell SDK 3.1.0.0.0 content - happy SPUing

## NOTES
This version of the Cell SDK (3.1.0.0.0) was designed for installation on an earlier Red Hat build (not Fedora 12 specifically). There are Fedora-specific versions of the Cell SDK available but they are earlier releases (made for earlier Fedoras). This version of the Cell SDK is the latest available and it works fine in Fedora 12 (ppc64) on Playstation 3 (OtherOS) - except for the default install script...

The default Cell SDK 3.1.0.0.0 install script contained in package **cell-install-3.1.0-0.0.noarch.rpm** from the Cell SDK 3.1.0.0.0 install repositories (hosted at [http://ps3linux.net/ps3_sdk31_repos/](ps3linux.net/ps3_sdk31_repos)) uses yum to install sets of packages from the Cell SDK 3.1.0.0.0 repos but is broken in Fedora 12 (ppc64). My script **ps3-cellsdk-install.sh** does the same thing, works in Fedora 12 (ppc64) on PS3, and was developed using the Cell SDK 3.1.0.0.0 install documentation.

One package NOT installed by my script (**cellide.rpm**) contains special settings for Cell Broadband Engine development in the Eclipse IDE. If you use Eclipse on your PS3 Linux Fedora 12 (ppc64) installation, consider manually installing the **cellide** package (after Cell SDK 3.1.0.0.0 installation): `sudo yum install cellide`.

The online Cell SDK 3.1.0.0.0 repos used by this script are hosted by myself on my own jailbroke Playstation 3 Linux web server at [http://ps3linux.net](ps3linux.net). Yes I bought my PS3 its own domain name... and its up 24/7... because I'm nuts.

If online Cell SDK 3.1.0.0.0 repos are down I'm probably just using my PS3 for gaming - sorry! Try running script **ps3-cellsdk-install** (as root) again later.

### The Model Citizen
