# Asus-Tuf-A15-Laptop-FanControlor

Here's a **step-by-step guide** to install **ROG Control Center** (which includes `asusctl` and the GUI) on **Arch Linux or Arch-based distros like Manjaro or EndeavourOS**.

---

## ✅ Step 1: Install Git and Base Development Tools

Open a terminal and run:

```bash
sudo pacman -S --needed git base-devel
```

This installs tools needed for building AUR packages.

---

## ✅ Step 2: Install an AUR Helper (Recommended)

We'll use `paru`, a popular AUR helper.

### Install `paru`:

```bash
git clone https://aur.archlinux.org/paru.git
cd paru
makepkg -si
```

---

## ✅ Step 3: Install `rog-control-center`

Now install the package using `paru`:

```bash
paru -S rog-control-center
```

- This will automatically install `asusctl` as a dependency.
- It builds and installs both the CLI (`asusctl`) and GUI (`rog-control-center`).

---

## ✅ Step 4: Start and Enable the Service

After installation, start the service:

```bash
sudo systemctl start asusd.service
sudo systemctl enable asusd.service
```

This enables ASUS ROG functionality on boot.

---

## ✅ Step 5: Reboot (Recommended)

Some kernel modules and services need a reboot to work properly:

```bash
sudo reboot
```

---

## ✅ Step 6: Launch ROG Control Center

Once your system restarts, open the application:

### From GUI:
- Open your app menu and search for **"ROG Control Center"**.
- Click to launch it.

### From Terminal:
```bash
rog-control-center
```

---

## 🔧 Optional: Check Kernel Module Support

If some features don't work (like fan control), you may need a patched kernel. You can install a custom kernel made for ASUS laptops:

```bash
paru -S linux-asus
```

Then select this kernel at boot using your bootloader (GRUB or systemd-boot).

---

## 🧪 Verify Installation

Run this command in terminal:

```bash
asusctl profile
```

You should see current mode (e.g., Performance, Balanced, Silent) — confirms `asusctl` is working.

---

✅ That’s it! You’ve successfully installed **ROG Control Center** and `asusctl`.


---

Want me to help with next steps?

