#!/usr/bin/env bash

PCAPFILE=$1

if (( $EUID != 0 )); then
     echo -e "Please run this script as root or with \"sudo\".\n"
     exit 1
fi

if [ -z $PCAPFILE ] || [ ! -f $PCAPFILE ]; then
    echo "File ${PCAPFILE} doesnt seem to be there - please supply a PCAP file."
    exit 1;
fi

# Clear the Suricata event log by truncating it.
: > /var/log/suricata/eve.json

# The VM did this to clear out EveBox, with containers EveBox is running in a
# different container.  Need to create an API call or something to clear it
# out.
#rm /var/lib/evebox/*
#sudo systemctl restart evebox.service

## replay pcap
tcpreplay -i eth1 -x 12 ${PCAPFILE} > /dev/null 2>&1

#print out alerts
echo -e "\nAlerts:\n"
grep '"event_type":"alert"' /var/log/suricata/eve.json  |jq '"\(.timestamp) | \(.alert.gid):\(.alert.signature_id):\(.alert.rev) | \(.alert.signature) | \(.alert.category) | \(.src_ip):\(.src_port) -> \(.dest_ip):\(.dest_port)"'
