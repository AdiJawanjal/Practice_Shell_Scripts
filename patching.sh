#!/bin/bash

LOGFILE="/var/log/patching-$(date +%F).log"

echo "Starting patching process: $(date)" | tee -a $LOGFILE

echo -e "\nUpdating package list..." | tee -a $LOGFILE
sudo apt update | tee -a $LOGFILE

echo -e "\nUpgrading packages..." | tee -a $LOGFILE
sudo apt upgrade -y | tee -a $LOGFILE

echo -e "\nCleaning up..." | tee -a $LOGFILE
sudo apt autoremove -y | tee -a $LOGFILE
sudo apt autoclean | tee -a $LOGFILE

# Optional: reboot if kernel was upgraded
if [ $(apt list --upgradable 2>/dev/null | grep -c "linux-image") -gt 0 ]; then
    echo -e "\nKernel update detected! Rebooting system..." | tee -a $LOGFILE
    sudo reboot
else
    echo -e "\nNo kernel update. No reboot required." | tee -a $LOGFILE
fi

echo "Patching completed: $(date)" | tee -a $LOGFILE

