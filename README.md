# kobo-tailscale
Install scripts for getting [Tailscale](https://tailscale.com) running on Kobo e-readers and persisting through reboots.

## Supported devices
- *Kobo Libra 2*

Currently only the Libra 2 is supported as it is the only device I have access to.
If you have another device and would like to contribute, please open a PR!

## Installation
> [!NOTE]  
> The version of Tailscale to install can be chosen by editing the `TAILSCALE_VERSION` variable in `install-tailscale.sh`.

1. Download this repo onto your Kobo e-reader's onboard storage and find your device.
2. Run `install-tailscale.sh` from the chosen device's directory.
3. Run `tailscale up` and follow the instructions to authenticate your e-reader!

## Uninstallation
Simply run `uninstall-tailscale.sh` from the chosen device's directory in the repo.

## Acknowledgements
[Dylan Staley for initial work and scripts on the Kobo Sage](https://dstaley.com/posts/tailscale-on-kobo-sage)

[jmacindoe for documenting kernel module compilation on Kobo readers](https://github.com/jmacindoe/kobo-kernel-modules)