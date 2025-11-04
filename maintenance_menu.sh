#!/bin/bash
# --------------------------------------------------
# maintenance_menu.sh - System Maintenance Suite
# --------------------------------------------------

while true; do
    clear
    echo "=========================================="
    echo "     🛠️  SYSTEM MAINTENANCE SUITE"
    echo "=========================================="
    echo "1. Run System Backup"
    echo "2. Perform System Update & Cleanup"
    echo "3. Monitor System Logs"
    echo "4. View Log Files"
    echo "5. Exit"
    echo "------------------------------------------"
    read -p "Enter your choice [1-5]: " choice

    case $choice in
        1) bash backup.sh ;;
        2) bash update_cleanup.sh ;;
        3) bash log_monitor.sh ;;
        4) echo "Available log files in ~/system_backups/"; ls ~/system_backups ;;
        5) echo "Exiting System Maintenance Suite..."; exit 0 ;;
        *) echo "Invalid option! Try again."; sleep 1 ;;
    esac

    echo
    read -p "Press Enter to return to the menu..."
done
