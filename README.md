# ubuntu-setup
A set of setup scripts for Ubuntu.

## Motivation
Ever reinstall Ubuntu on your computer only to spend the next several days reinstalling everything? This project started out as a way to save time when reinstalling by setting up everything. Please note that aside from installing everything, it also sets up many configuration files too. I would recommend going through the script and commenting out any configs that you don't find useful before using this script.

This project follows the kitchen-sink philosophy: install anything and everything that could possibly be useful, and don't allow the user a choice over what to install/configure if the only cost is additional disk space usage (however, for things like drivers, keybinds, etc, the user should have a say in the matter). As such, this should not be used in security-critical applications, because this project has an absolutely massive attack surface. 

## Usage

To install after clean Ubuntu desktop install:

    ./setup desktop

To install CUDA without video drivers (for ML):

    ./setup cuda
   
