#!/bin/bash

TARGET_RANGE=$1
OUTPUT_DIR="netscan_results"

if [[ -z "$TARGET_RANGE" ]]; then
    echo "Usage: $0 <IP or CIDR range>"
    exit 1
fi

# Check if the target range is an IP address
if [[ "$TARGET_RANGE" =~ ^([0-9]{1,3}\.){3}[0-9]{1,3}$ ]]; then
    TARGET_RANGE="$TARGET_RANGE/32"
fi

PORTS="3389,22,80,443,445,8080,8000,25,110,2049,5985"

mkdir -p "$OUTPUT_DIR"
rustscan -a "$TARGET_RANGE" -p "$PORTS" --ulimit 5000 --scripts none | grep '\->' | awk '{print $1}' > "$OUTPUT_DIR/netscan-ips.txt"

if [[ ! -s "$OUTPUT_DIR/netscan-ips.txt" ]]; then
    echo "No active hosts found."
    exit 0
fi

while read -r IP; do
    IP_DIR="$OUTPUT_DIR/$IP"
    mkdir -p "$IP_DIR"
    cd "$IP_DIR"
    scan "$IP"
    cd - > /dev/null
done < "$OUTPUT_DIR/netscan-ips.txt"
