#!/bin/bash
# --------------------------------------------------
# update_cleanup.sh - System Update and Cleanup
# --------------------------------------------------

LOG_FILE="$HOME/system_backups/update_log.txt"
DATE=$(date +%Y-%m-%d_%H-%M-%S)

echo "[$DATE] Starting system update and cleanup..." | tee -a "$LOG_FILE"

# Update and upgrade system packages
sudo apt update -y >>"$LOG_FILE" 2>&1
sudo apt upgrade -y >>"$LOG_FILE" 2>&1

# Remove unused packages and clean cache
sudo apt autoremove -y >>"$LOG_FILE" 2>&1
sudo apt autoclean -y >>"$LOG_FILE" 2>&1

if [ $? -eq 0 ]; then
    echo "[$DATE] ✅ Update and cleanup completed successfully." | tee -a "$LOG_FILE"
else
    echo "[$DATE] ❌ Errors occurred during update/cleanup." | tee -a "$LOG_FILE"
fi
