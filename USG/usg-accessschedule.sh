#!/bin/bash
# Script to restrict time and service access of kids
configure

# Create Time period
set service webproxy url-filtering squidguard time-period KidsBlock description 'Kids device off time'
set service webproxy url-filtering squidguard time-period KidsBlock days all time 09:00-15:00
#set service webproxy url-filtering squidguard time-period KidsBlock days weekdays time 20:30-24:00
#set service webproxy url-filtering squidguard time-period KidsBlock days weekend time 22:00-24:00

# Set address scope to match kids wifi VLAN 
set service webproxy url-filtering squidguard source-group Kids address 192.168.200.0/24

# Assign schedule and group to rule
set service webproxy url-filtering squidguard rule 1 source-group Kids
set service webproxy url-filtering squidguard rule 1 time-period KidsBlock

# Set access rules
set service webproxy url-filtering squidguard rule 1 default-action block

# Set listening adress
set service webproxy listen-address 192.168.200.1

commit
