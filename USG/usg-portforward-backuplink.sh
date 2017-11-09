configure

# Redirect port 80 to web proxy
set service nat rule 2001 description WAN2-HTTP
set service nat rule 2001 destination port 80
set service nat rule 2001 inbound-interface eth2
set service nat rule 2001 inside-address address 192.168.10.5
set service nat rule 2001 inside-address port 80
set service nat rule 2001 log disable
set service nat rule 2001 protocol tcp
set service nat rule 2001 type destination

# Redirect port 443 to web proxy
set service nat rule 2002 description WAN2-HTTPS
set service nat rule 2002 destination port 443
set service nat rule 2002 inbound-interface eth2
set service nat rule 2002 inside-address address 192.168.10.5
set service nat rule 2002 inside-address port 443
set service nat rule 2002 log disable
set service nat rule 2002 protocol tcp
set service nat rule 2002 type destination

# Redirect port 7700 to Surveillance
set service nat rule 2003 description WAN2-CAM
set service nat rule 2003 destination port 7700
set service nat rule 2003 inbound-interface eth2
set service nat rule 2003 inside-address address 192.168.0.11
set service nat rule 2003 inside-address port 7700
set service nat rule 2003 log disable
set service nat rule 2003 protocol tcp
set service nat rule 2003 type destination

commit;save;exit
