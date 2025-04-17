#!/bin/sh

set -e

if ! command -v tailscale > /dev/null 2>&1; then
  echo "tailscale command not found. Please install Tailscale first."
  exit 1
fi

export TAILSCALE_VERSION=1.82.0

get_pkg_url() {
  echo "https://pkgs.tailscale.com/stable/tailscale_${1}_arm.tgz"
}

# Check if the version argument was provided and is valid
if [ -n "$1" ]; then
  if wget --spider -q "$(get_pkg_url "$1")" > /dev/null 2>&1; then
    TAILSCALE_VERSION="$1"
  else
    echo "Version '$1' not found. Check available versions at https://pkgs.tailscale.com/stable/#static"
    exit 1
  fi
fi

readonly CURRENT_VERSION=$(tailscale version | grep -o '^[0-9]\+\.[0-9]\+\.[0-9]\+')

echo
echo "Updating Tailscale from ${CURRENT_VERSION} to ${TAILSCALE_VERSION}"
uname -a
echo

pid=$(pgrep tailscaled || true)
if [ -n "$pid" ]; then
  echo "Stopping Tailscale ..."
  
  tailscale down

  kill -15 "$pid"

  # Wait a little bit for the daemon to terminate cleanly.
  sleep 3

  echo "Tailscale stopped successfully."
fi

readonly PKG_URL=$(get_pkg_url "$TAILSCALE_VERSION")
echo "Downloading $PKG_URL ..."
wget $PKG_URL
tar -xvf tailscale_${TAILSCALE_VERSION}_arm.tgz

echo "Updating binaries ..."
mv -f tailscale_${TAILSCALE_VERSION}_arm/tailscale /mnt/onboard/tailscale
mv -f tailscale_${TAILSCALE_VERSION}_arm/tailscaled /mnt/onboard/tailscale

echo "Cleaning up installation files ..."
rm -rf tailscale_${TAILSCALE_VERSION}_arm
rm -rf tailscale_${TAILSCALE_VERSION}_arm.tgz

echo
echo "Launching Tailscale ..."
/usr/local/tailscale/boot.sh
tailscale up

echo
echo "Update complete!"
tailscale version
echo
