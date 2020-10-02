#!/bin/bash

COUNTRY="de"
DESTINATION="configs"

while getopts 'c:p:' flag; do
  case "${flag}" in
    c) COUNTRY="${OPTARG}";;
    p) DESTINATION="${OPTARG}";;
  esac
done

mkdir -p $DESTINATION

for i in {1..1200}
do
    if ! test -f "$DESTINATION/$COUNTRY$i.nordvpn.com.tcp443.ovpn"; then
        wget --directory-prefix=$DESTINATION "https://downloads.nordcdn.com/configs/files/ovpn_legacy/servers/$COUNTRY$i.nordvpn.com.tcp443.ovpn"
    fi
done
