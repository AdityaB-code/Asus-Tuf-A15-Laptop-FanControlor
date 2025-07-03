#!/bin/bash

# --------------------------------------------------------
# arch-auto-update.sh
# Updates system, rebuilds initramfs, regenerates GRUB.
# --------------------------------------------------------

echo ">>> [$(date)] Starting Arch auto-update"

# Full system upgrade
pacman -Syu --noconfirm

# Rebuild initramfs for all kernels
mkinitcpio -P

# Regenerate GRUB config
grub-mkconfig -o /boot/grub/grub.cfg

echo ">>> [$(date)] Arch auto-update complete"
