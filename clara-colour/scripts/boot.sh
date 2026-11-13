#!/bin/sh

# Start by renicing ourselves to a neutral value, to avoid any mishap...
renice 0 -p $$

# Launch in the background, with a clean env, after a setsid call to make very very sure udev won't kill us ;).
env -i -- setsid /usr/local/tailscale/on-boot.sh &

# Done :)
exit 0