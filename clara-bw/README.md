# Kobo Libra Color

## Modules
Tailscale requires the TUN/TAP device driver to be loaded to function.
This is included in the Libra Color kernel though

# iptables
Tailscale requires the `iptables` binary and shared libraries to be present on the device to function.
These are not included in the stock Kobo Libra Color image so this repo provides it as 
pre-built binaries/libraries in the `binaries` directory.

This was pulled from the [July 5th 2017 build of Raspbian](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05)
which also bundles the source code. This was done to match the glibc version used in the Libra Color image.

## Upgrade Tailscale Version
The [`upgrade-tailscale.sh`](./upgrade-tailscale.sh) script assumes Tailscale was installed using [`install-tailscale.sh`](./install-tailscale.sh).

By default, it upgrades to the version specified in the `TAILSCALE_VERSION` variable in [`upgrade-tailscale.sh`](./upgrade-tailscale.sh).
You can override this by providing a version as an argument when running the script, for example: `./upgrade-tailscale.sh 1.80.3`.
