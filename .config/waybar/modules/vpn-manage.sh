#!/bin/sh

if [ $(nmcli -f TYPE con show --active | grep vpn | wc -l) -gt 0 ]
then
    nmcli connection down nkrunic__ssl_vpn_config
else
    nmcli connection up nkrunic__ssl_vpn_config
fi

exit 0
