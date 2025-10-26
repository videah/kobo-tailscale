# Kobo Sage

## Modules
Tailscale requires the TUN/TAP device driver to be loaded to function.
This is included in the Sage kernel though

# iptables
Tailscale requires the `iptables` binary and shared libraries to be present on the device to function.
These are not included in the stock Kobo Sage image so this repo provides it as 
pre-built binaries/libraries in the `binaries` directory.

This was pulled from the [July 5th 2017 build of Raspbian](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05)
which also bundles the source code. This was done to match the glibc version used in the Sage image.
