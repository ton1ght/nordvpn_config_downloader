#!/bin/bash

RESET=0
DESTINATION="configs"

while getopts 'xp:' flag; do
  case "${flag}" in
    x) RESET=1 ;;
    p) DESTINATION="${OPTARG}";;
  esac
done

if [[ $RESET -eq 0 ]]; then
    echo -n "Username: "
    read USERNAME
    echo -n "Password: "
    read -s PASSWORD
fi

for f in $DESTINATION/*.ovpn
do
    NAME=${f%.ovpn}
    NAME=${NAME#"$DESTINATION/"}
    if [[ $RESET -eq 0 ]]; then
        nmcli connection import type openvpn file $f

         nmcli connection modify $NAME +vpn.data username=$USERNAME
         nmcli connection modify $NAME vpn.secrets password=$PASSWORD
    else
        nmcli connection delete $NAME
    fi
done
