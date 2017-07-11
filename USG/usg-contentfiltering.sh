#!/bin/bash
# Script to set content filtering on Ubiquiti Secure Gateway


# Update content blacklist database (takes ages)
update webproxy blacklists

# Go into configuration mode
configure

# General service settings
set service webproxy cache-size 0
set service webproxy default-port 3128
set service webproxy mem-cache-size 5

# Categories to block
set service webproxy url-filtering squidguard block-category adult
set service webproxy url-filtering squidguard block-category porn

# Allow ip address access otherwise local access snuffed when DNS entry not present
set service webproxy url-filtering squidguard allow-ipaddr-url

# Set Default action to allow
set service webproxy url-filtering squidguard default-action allow

# Enable Safe search
set service webproxy url-filtering squidguard enable-safe-search

# Allow local access
set service webproxy url-filtering squidguard local-ok 192.168.0.0
set service webproxy url-filtering squidguard local-ok home.local
set service webproxy url-filtering squidguard local-ok-url home.local

# Set WAN gateway port to listen on
set service webproxy listen-address 192.168.0.1
set service webproxy listen-address 192.168.200.1

# Set Source group covering all local IP Addresses
set service webproxy url-filtering squidguard source-group Home address 192.168.0.0/16
set service webproxy url-filtering squidguard source-group Home description 'General Home Address Range'


# Set default URL to redirect to when blocked site attempt occurs
set service webproxy url-filtering squidguard redirect-url http://192.168.10.5/filter-redirect.html

# Commit and save changes
commit
save
