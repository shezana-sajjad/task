#!/bin/bash
echo "shezana"

# Retrieve and display the system hostname
hostname=$(hostname)
echo "System name: $hostname"

# Use lscpu to get information about CPUs
cpu_count=$(lscpu | grep '^CPU(s):' | awk '{print $2}')

echo "Total number of CPUs: $cpu_count"

# Use nproc to get the number of processing units (CPUs or cores)
cpu_count=$(nproc)

echo "Total number of CPUs: $cpu_count"

# Use cat command to read /proc/meminfo
mem_info=$(cat /proc/meminfo)

echo "Memory Information:"
echo "$mem_info"

# SSD total storage calculation
ssd_total=$(lsblk -b -d -o NAME,SIZE,ROTA | awk '$3 == "0" {total += $2} END {print total}')
ssd_total_gb=$(echo "scale=2; $ssd_total / 1024 / 1024 / 1024" | bc)

# HDD total storage calculation
hdd_total=$(lsblk -b -d -o NAME,SIZE,ROTA | awk '$3 == "1" {total += $2} END {print total}')
hdd_total_gb=$(echo "scale=2; $hdd_total / 1024 / 1024 / 1024" | bc)

echo "Total SSD storage: $ssd_total_gb GB"
echo "Total HDD storage: $hdd_total_gb GB"


