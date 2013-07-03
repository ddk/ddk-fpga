# Install Libero Designer/ModelSim/Synplify/etc. on Ubuntu 12.04.1 LTS by Matt Gardner

### Notes
- I am using the en_CA locale; en_US should probably work too. Other locales may encounter font problems.
- Skip pre-requisite packages at-your-on-risk!
- Let us know if you encountered any other problems/solutions.

### Installation Steps

*	Install some pre-requisites: sudo apt-get install ksh portmap lsb-core libmotif3 xls xlstt xfonts-100dpi xfonts75dpi
*	REBOOT!!!
*	Download/extract Libero SoC installer: http://soc.microsemi.com/download/reg/download.aspx?p=f=LiberoSoCv11_1_LIN
*	Install LiberoSoC: sudo chmod +x LiberoSoCV11_1Linux.bin && sudo ./LiberoSoCV11_1Linux.bin
*	Download/extract license manager binaries to /some/folder: http://www.microsemi.com/fpga-soc/design-resources/licensing#downloads
*	Download/extract License.dat file to /some/folder(Libero Gold Floating License for Linux Server):  http://www.microsemi.com/fpga-soc/design-resources/design-software/libero-soc#licensing
*	Modify your License.dat file to include your Hostname and lm binary directories: Replace tags <put.hostname.here>  and path_to_actlmgrd, path_to...

Example:
	
	SERVER COMPUTERNAME f0deadbeef3d 1702
	DAEMON actlmgrd /home/YOURUSERNAME/licenses/actlmgrd
	DAEMON mgcld  /home/YOURUSERNAME/licenses/mgcld
	VENDOR snpslmd  /home/YOURUSERNAME/licenses/snpslmd

*	Run the wind/u cleanup script: /usr/local/microsemi/Libero_v11.1/Libero/bin/actel_wuclean -R
*	Modify rpcbind's starup params and restart portmap: 
echo 'OPTIONS="-w -i"' | sudo tee /etc/default/rpcbind
sudo service portmap restart

*	lmgrd requires you to: sudo mkdir /usr/tmp
*	Some required exports (x11 libraries, license file dir, display/lang for wind/u):

Exports:

	export LD_LIBRARY_PATH="/usr/lib/i386-linux-gnu/"
	export LM_LICENSE_FILE=1702@localhost
	export DISPLAY=:0

*	Run license manager daemon: lmgrd -c /some/folder/License.dat -l /some/folder/lic.log
*	Run Designer: /usr/local/microsemi/Libero_v11.1/Libero/bin/designer
*	Run ModelSim: /usr/local/microsemi/Libero_v11.1/Model/modeltech/linuxacoem/vsim
*	Run Synplify: /usr/local/microsemi/Libero_v11.1/Synplify/bin/synplify_pro



