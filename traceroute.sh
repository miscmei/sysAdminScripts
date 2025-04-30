#!/bin/bash

# function tracerouteOption{
echo ""
echo "----------Welcome to the Traceroute Page----------"
echo ""

while true; do
echo "Choose an IP address to test connectivity with (type 1-4):"
echo "    1) Skidmore College 141.222.36.194"
echo "    2) Google 8.8.8.8"
echo "    3) The White House 156.33.241.5"
echo "    4) Yonsei University 1.233.208.0/20"
echo "    5) Exit"
echo ""
# -p prompts the user with a message, also prevents the script from infinitely printing the options
read -p "Enter your choice: " choice

case $choice in
    1) 
    traceroute 141.222.36.194
    ;;

    2) 
    traceroute 8.8.8.8
    echo ""
    ;;

    3) 
    traceroute 156.33.241.5
    ;;

    4) 
    traceroute 1.233.208.15
    ;;

    5)
    echo ""
    echo "Goodbye. Back to the main menu."
    echo ""
    break
    ;;

    * ) 
    echo "Invalid choice. Please select again. " 
    ;;
esac
echo ""
done
echo ""
# }