#!/bin/bash

export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"

exiterr()  { echo "Error: $1" >&2; exit 1; }
nospaces() { printf %s "$1" | sed -e 's/^[[:space:]]*//' -e 's/[[:space:]]*$//'; }
noquotes() { printf %s "$1" | sed -e 's/^"\(.*\)"$/\1/' -e "s/^'\(.*\)'$/\1/"; }

if [ ! -f "/.dockerenv" ]; then
  exiterr "This script ONLY runs in a Docker container."
fi

if ip link add dummy0 type dummy 2>&1 | grep -q "not permitted"; then
cat 1>&2 <<'EOF'
    Error: This Docker image must be run in privileged mode.
    For detailed instructions, please visit:
    https://github.com/lihti/
EOF
  exit 1
fi
ip link delete dummy0 >/dev/null 2>&1

sed -i "s|{{conn_name}}|$CNAME|g" /tmp/ipsec.conf 
sed -i "s|{{local-pip}}|$LPIP|g" /tmp/ipsec.conf
sed -i "s|{{local-cidr}}|$LCIDR|g" /tmp/ipsec.conf

sed -i "s|{{remote-pip}}|$RPIP|g" /tmp/ipsec.conf
sed -i "s|{{remote-cidr}}|$RCIDR|g" /tmp/ipsec.conf

sed -i "s|{{local-pip}}|$LPIP|g" /tmp/ipsec.secrets
sed -i "s|{{remote-pip}}|$RPIP|g" /tmp/ipsec.secrets
sed -i "s|{{psk}}|$PSK|g" /tmp/ipsec.secrets

mv /tmp/ipsec.conf /etc/ipsec.d/$CNAME.conf
mv /tmp/ipsec.secrets /etc/ipsec.d/$CNAME.secrets

echo "include /etc/ipsec.d/${CNAME}.conf" >> /etc/ipsec.conf
echo "include /etc/ipsec.d/${CNAME}.secrets" >> /etc/ipsec.secrets

modprobe af_key
/usr/local/sbin/ipsec start --config /etc/ipsec.conf
#/etc/init.d/ipsec start

/bin/bash