# DDK-FPGA
## Table of Contents
* [Introduction](#introduction)
* [Libero SoC Toolchain](#libero-soc-toolchain)
	* [Requesting a license](#requesting-a-license)
	* [Installing the software](#installing-the-software)
	* [Linux installation](#linux-installation)

## Introduction

This repository contains the HDL and constraint files necesseray for building the FPGA bitstream.
This repository also contains the testbenches and macro files used for simulation and verification of the behavioral model.
The DDK currently utilizes a Microsemi ProASIC3 Nano 125 [A3PN125][datasheet] FPGA.

## Libero SoC Toolchain

For development for the Microsemi FPGAs the [Libero SoC Suite][libero] and a [free Libero Gold License][licensing] is required.
To obtain a lincese you must register with Microsemi.
The following outlines the steps necessary for installing the toolchain.

### Requesting a license
1.	Register for an account on the [Microsemi Support Portal][portal].
*	Request a product license in the [Microsemi Support Portal][portal].
	Login and click "Request free license".
*	Select the "Libero Gold Node Locked for Windows" license option.
	Note, we recommend using the Windows version of the toolchain.
*	Enter a "DiskID" into the form.
	The easiest way to get a volume ID is to execute ```Vol C:``` in Command Prompt.
*	At this point you should have successfully requested a license. The license requests usually take less than an hour.

### Installing the software.
1.	Next, download the latest version of Libero SoC [here][downloads].
	Again, we recommend using the Windows version of the toolchain.
	We recommend installing the (large) "Self-Contained EXE" versus the "Web Install EXE".
*	During installation you may be prompted to install install either "Libero SoC" or "Libero SoC SA (Standalone)".
	Select the "Libero SoC" version.
*	When prompted, make sure you select and install atleast the ProASIC 3 Nano FPGA libraries.
	Note: you can also do this after the installation by starting "Uninstall or Modify Libero SoC" from the start menu and modifying the installation.
*	After installation and once you have recieved your license, you can install it using the Actel License utility.
	This utility sets an enviornment variable that points to the License file, hence you may need to log out or restart the machine.
*	To verify that the license is working, try starting "Synopsys Synplify".
	If you do not see license errors, than the license has been installed correctly.

### Linux installation.
We do not support the linux toolchain, however, people have reported this to be working.
If you wish to use the Microsemi toolchain under Linux, you can try Matt Gardner's linux instructions [here](README.linux.md).

<!-- Links -->
[datasheet]: http://www.actel.com/documents/PA3_nano_DS.pdf
[downloads]: http://www.microsemi.com/fpga-soc/design-resources/design-software/libero-soc#downloads
[libero]: http://www.microsemi.com/fpga-soc/design-resources/design-software/libero-soc
[licensing]: http://www.microsemi.com/fpga-soc/design-resources/design-software/libero-soc#licensing
[portal]: https://soc.microsemi.com/Portal/
