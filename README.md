# kobo-tailscale
Install scripts for getting [Tailscale](https://tailscale.com) running on Kobo e-readers and persisting through reboots.

## Supported devices
- *Kobo Libra 2*
- *Koba Libra Colour*/*Koba Libra Color*
- *Kobo Clara BW*
- *Kobo Sage*

If you have another device and would like to contribute, please open a PR!

## Installation
> [!NOTE]  
> The version of Tailscale to install can be chosen by editing the `TAILSCALE_VERSION` variable in `install-tailscale.sh`.

1. Download this repo onto your Kobo e-reader's onboard storage and find your device.
2. Run `install-tailscale.sh` from the chosen device's directory.
3. Run `tailscale up` and follow the instructions to authenticate your e-reader!

## Uninstallation
Simply run `uninstall-tailscale.sh` from the chosen device's directory in the repo.

## DNS Issues
When there's no DNS manager on a system, Tailscale will resort to just [overwriting resolv.conf](https://tailscale.com/kb/1235/resolv-conf/)
which can cause issues on Kobo devices. If you find that DNS breaks after a while you can fix this by running
`tailscale set --accept-dns=false` on your device to prevent it from overwriting resolv.conf.

## Acknowledgements
[Dylan Staley for initial work and scripts on the Kobo Sage](https://dstaley.com/posts/tailscale-on-kobo-sage)

[jmacindoe for documenting kernel module compilation on Kobo readers](https://github.com/jmacindoe/kobo-kernel-modules)
