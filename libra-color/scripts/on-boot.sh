#!/bin/sh

# Make sure to load the TUN kernel module and create the /dev/net/tun device
if [ ! -c /dev/net/tun ]; then
  mkdir -p /dev/net
  mknod /dev/net/tun c 10 200
fi

# Make absolutely sure that iptables is in the PATH
export PATH=/usr/sbin:/usr/bin:$PATH

# Make sure /mnt/onboard is mounted
timeout 5 sh -c "while ! grep -q /mnt/onboard /proc/mounts; do sleep 0.1; done"
if [[ $? -eq 143 ]]; then
    exit 1
fi

case "$(pidof tailscaled | wc -w)" in
0) tailscaled --statedir=/mnt/onboard/tailscale &> /tailscaled.log &
   ;;
esac

exit 0
