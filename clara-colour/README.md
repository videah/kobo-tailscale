# Kobo Clara Colour

Tested on firmware 4.46.23852 / Linux 4.9.77 (MediaTek MT8110) with Tailscale 1.104.7.

## Modules
Tailscale requires the TUN/TAP device driver to be loaded to function.
This is built into the Clara Colour kernel (`CONFIG_TUN=y`) and `/dev/net/tun` already exists, so no module is needed.

# iptables
Tailscale requires the `iptables` binary and shared libraries to be present on the device to function.
The kernel has `iptables` and `ip6tables` support, but the userspace tools are not included in the stock Kobo Clara Colour image,
so this repo provides them as pre-built binaries/libraries in the `binaries` directory.
`xtables-multi` provides both, so the install script symlinks it as `iptables` and `ip6tables`.

This was pulled from the [July 5th 2017 build of Raspbian](http://downloads.raspberrypi.org/raspbian/images/raspbian-2017-07-05)
which also bundles the source code. Those binaries need glibc 2.7 or newer, and the Clara Colour ships glibc 2.19.

`iptables` also needs its extension modules (`libxt_standard.so` and friends) in `/lib/xtables`.
Without them Tailscale logs `Couldn't load target 'standard'` and cannot install its firewall rules.
These are in `binaries/iptables/lib/xtables.tar.gz` (a tarball because pairs such as `libxt_mark.so` and
`libxt_MARK.so` collide on the Kobo's case-insensitive FAT storage), taken unmodified from the Raspbian
[`iptables_1.4.21-2_armhf.deb`](https://legacy.raspbian.org/raspbian/pool/main/i/iptables/iptables_1.4.21-2_armhf.deb)
(sha256 `be003cc376fce40e800ea15bc42c6487a33b0544c779eaa0b1ce11548ae84b03`). The other bundled iptables
files are byte-identical to the ones in that package and in `libxtables10_1.4.21-2_armhf.deb`.
