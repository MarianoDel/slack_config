#!/bin/bash

# connect.sh

# Usage:
# $ connect.sh <device> <port speed>
# Example: connect.sh /dev/ttyS0 9600

# Set up device
stty -F $1 $2 cs8 -cstopb

# Let cat read the device $1 in the background
while true;
do
	cat < $1
done
