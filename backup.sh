#!/bin/bash
# --------------------------------------------------
# backup.sh - Automated System Backup Script
# --------------------------------------------------

# Define directories and files
SOURCE_DIR="$HOME/Documents"                  # Directory to backup
DEST_DIR="$HOME/system_backups"               # Backup destination
DATE=$(date +%Y-%m-%d_%H-%M-%S)               # Timestamp
BACKUP_FILE="$DEST_DIR/backup_$DATE.tar.gz"   # Backup file name
LOG_FILE="$DEST_DIR/backup_log.txt"           # Log file

# Create backup destination if it doesn't exist
mkdir -p "$DEST_DIR"

echo "[$DATE] Starting system backup..." | tee -a "$LOG_FILE"

# Create a compressed backup
tar -czf "$BACKUP_FILE" "$SOURCE_DIR" 2>>"$LOG_FILE"

# Check success or failure
if [ $? -eq 0 ]; then
    echo "[$DATE] ✅ Backup successful: $BACKUP_FILE" | tee -a "$LOG_FILE"
else
    echo "[$DATE] ❌ Backup failed!" | tee -a "$LOG_FILE"
fi
