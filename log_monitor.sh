#!/bin/bash
# --------------------------------------------------
# log_monitor.sh - System Log Monitoring Script
# --------------------------------------------------

LOG_FILE="/var/log/syslog"                       # System log location
ALERT_LOG="$HOME/system_backups/log_alerts.txt"  # Output alert log
DATE=$(date +%Y-%m-%d_%H-%M-%S)
KEYWORDS=("error" "fail" "critical")              # Keywords to search

echo "[$DATE] Scanning system logs for issues..." > "$ALERT_LOG"

# Search for matching keywords
for word in "${KEYWORDS[@]}"; do
    grep -i "$word" "$LOG_FILE" >> "$ALERT_LOG"
done

# If any errors found, alert user
if [ -s "$ALERT_LOG" ]; then
    echo "⚠️  Alerts found! Check $ALERT_LOG for details."
else
    echo "[$DATE] ✅ No critical issues found in system logs."
fi
