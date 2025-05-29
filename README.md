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


After installing `asusctl` and `supergfxctl` via `yay`, here’s what we did next:

---

### 🔧 Steps after installation:

1. **Enabled and started the `supergfxd` service:**

```bash
sudo systemctl enable --now supergfxd
```

2. **Checked if `asusctl` is installed and working:**

```bash
which asusctl
asusctl --version
```

3. **Explored `asusctl` fan control commands and options:**

```bash
asusctl fan-curve --help
```

4. **Installed `lm_sensors` to read hardware temperatures:**

```bash
sudo pacman -S lm_sensors
sudo sensors-detect   # then accepted defaults
```

5. **Checked CPU and GPU temperatures:**

```bash
sensors
nvidia-smi --query-gpu=temperature.gpu --format=csv,noheader
```

6. **Created and set a custom fan curve to control fan speed (targeting \~4500 RPM):**

```bash
sudo asusctl fan-curve --mod-profile performance --fan cpu --data "30c:235,40c:235,50c:235,60c:235,70c:235,80c:235,90c:235,100c:235"
sudo asusctl fan-curve --mod-profile performance --enable-fan-curves true
sudo asusctl profile performance
```

7. **Wrote a Bash script to monitor CPU and GPU temperatures easily.**

---

Want me to help with next steps?

