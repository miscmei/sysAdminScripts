#!/bin/bash
# source ./traceroute.sh

echo "----------Hello, Administrator. What would you like to do today?----------"
echo ""

while true; do
  echo "Choose an option (type 1-4):"
  echo "    1) Test Connectivity with Certain IP Addresses"
  echo "    2) Backup Folders"
  echo "    3) Exit"
  read -p "Enter your choice: " choice
  
  case $choice in
    1 )
    source ./traceroute.sh
    # tracerouteOption
    ;;

    2 )
    source ./backupFolders.sh
    ;;

    3)
    echo ""
    echo "Goodbye, Administrator."
    echo ""
    break
    ;;

    * ) 
    echo "Invalid choice. Please select again. " 
    ;;
  esac


    echo "-------------------------"
  done
