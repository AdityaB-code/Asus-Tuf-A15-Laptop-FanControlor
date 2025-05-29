# Asus-Tuf-A15-Laptop-FanControlor

Asus Tuf A15 Gaming Laptop fan speed control.

Step 1 : 

Install yay
   You previously used this command to install `yay`:

```bash
git clone https://aur.archlinux.org/yay.git && cd yay && makepkg -si
```

This is the standard and correct way to install `yay` from the AUR.


Step 2 : 

Here are all the things you installed using `yay`:

---

### ✅ Installed via `yay`:

1. **`asusctl`** – For ASUS laptop control (fan curves, profiles, aura, etc.)

   ```bash
   yay -S asusctl
   ```

2. **(Implicit)** `supergfxctl` – Installed as a dependency or separately for GPU switching support

   ```bash
   yay -S supergfxctl
   ```

---

If you want to verify what you've installed via `yay`, you can run:

```bash
pacman -Qem
```

This lists all **AUR packages** (explicitly installed using `yay` or similar).

Let me know if you want to export or clean up that list.
