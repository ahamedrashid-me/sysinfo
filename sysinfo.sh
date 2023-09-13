#!/bin/bash

# Function to display the menu
display_menu() {
  PS3="Select an option (enter the number): "
  options=("Option 1 - View Kernel Version"
           "Option 2 - View OS Information"
           "Option 3 - View CPU Information"
           "Option 4 - View Disk Space"
           "Option 5 - View Memory Usage"
           "Option 6 - View Network Interfaces"
           "Option 7 - View System Uptime"
           "Option 8 - Clear Results"
           "Option 9 - Quit")

  select option in "${options[@]}"; do
    case $REPLY in
      1) # View Kernel Version
         uname -a ;;
      2) # View OS Information
         lsb_release -a ;;
      3) # View CPU Information
         lscpu ;;
      4) # View Disk Space
         df -h ;;
      5) # View Memory Usage
         free -h ;;
      6) # View Network Interfaces
         ifconfig ;;
      7) # View System Uptime
         uptime ;;
      8) # Clear Results
         clear ;;
      9) # Quit
         echo "Exiting the script."
         exit 0 ;;
      *)
         echo "Invalid option. Please select a number between 1 and 9." ;;
    esac
  done
}

# Initial display of the menu
display_menu

