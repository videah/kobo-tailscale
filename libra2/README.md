# Kobo Libra 2

## Modules
Tailscale requires the TUN/TAP device driver to be loaded to function.
This is not included in the stock Kobo Libra 2 kernel so this repo provides it as a 
pre-built kernel module in the `modules` directory.

This was built from the [Libra 2 kernel source code](https://github.com/kobolabs/Kobo-Reader/tree/master/hw/imx6sll-libra2)
provided by Rakuten following the instructions found on the [kobo-kernel-modules](https://github.com/jmacindoe/kobo-kernel-modules/tree/main/Kobo%20Mark%209%20-%20Libra%202)
repo.

# iptables
Tailscale requires the `iptables` binary and shared libraries to be present on the device to function.
These are not included in the stock Kobo Libra 2 kernel so this repo provides it as 
pre-built binaries/libraries in the `binaries` directory.

This was pulled from the [July 5th 2017 build of Raspbian](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05)
which also bundles the source code. This was done to match the glibc version used in the Libra 2 kernel.