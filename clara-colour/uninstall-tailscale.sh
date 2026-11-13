#!/bin/sh

echo "Uninstalling tailscale..."

pid=$(pgrep tailscaled)
if [ -n "$pid" ]; then
  echo "Terminating tailscale daemon with PID $pid ..."
  kill -15 "$pid"

  # Wait a little bit for the daemon to terminate cleanly.
  sleep 3

  echo "Tailscale daemon terminated successfully."
fi

echo "Removing iptables binaries from /sbin and /lib ..."
rm -f /sbin/xtables-multi /sbin/iptables /sbin/ip6tables
rm -f /lib/libxtables.so.10 /lib/libip4tc.so.0 /lib/libip6tc.so.0
rm -f /lib/libxtables.so.10.0.0 /lib/libip4tc.so.0.1.0 /lib/libip6tc.so.0.1.0
rm -rf /lib/xtables

echo "Removing tailscale binaries from /mnt/onboard/tailscale and /usr/bin ..."
rm -rf /mnt/onboard/tailscale
rm -f /usr/bin/tailscale /usr/bin/tailscaled

echo "Removing tailscale boot and load scripts from /usr/local/tailscale ..."
rm -rf /usr/local/tailscale

echo "Removing tailscale udev rule from /etc/udev/rules.d ..."
rm -f /etc/udev/rules.d/98-tailscale.rules

echo "Uninstallation complete!"
