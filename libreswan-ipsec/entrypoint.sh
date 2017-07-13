#!/bin/bash

sed -i "s|{{conn_name}}|$CNAME|g" /tmp/ipsec.conf 
sed -i "s|{{local-pip}}|$LPIP|g" /tmp/ipsec.conf
sed -i "s|{{local-cidr}}|/$LCIDR|g" /tmp/ipsec.conf

sed -i "s|{{remote-pip}}|$RPIP|g" /tmp/ipsec.conf
sed -i "s|{{remote-cidr}}|$RCIDR|g" /tmp/ipsec.conf

sed -i "s|{{local-pip}}|$LPIP|g" /tmp/ipsec.secrets
sed -i "s|{{remote-pip}}|$RPIP|g" /tmp/ipsec.secrets
sed -i "s|{{psk}}|$PSK|g" /tmp/ipsec.secrets

mv /tmp/ipsec.conf /etc/ipsec.d/$CNAME.conf
mv /tmp/ipsec.secrets /etc/ipsec.d/$CNAME.secrets

echo "include /etc/ipsec.d/${CNAME}.conf" >> /etc/ipsec.conf
echo "include /etc/ipsec.d/${CNAME}.secrets" >> /etc/ipsec.secrets
/etc/init.d/ipsec start

/bin/bash