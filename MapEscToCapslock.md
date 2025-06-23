Since you're using **Hyprland** (Wayland), the recommended tool to remap keys is **`interception-tools`** with **`caps2esc`**.

### ✅ Step-by-step: Map `Caps Lock` → `Esc` on Hyprland

---

### 🔧 1. **Install tools**

On Arch-based distros:

```bash
sudo pacman -S interception-tools interception-caps2esc
```

---

### ⚙️ 2. **Create config for `udevmon`**

Create a config file:

```bash
sudo mkdir -p /etc/interception
sudo nano /etc/interception/udevmon.yaml
```

Paste this:

```yaml
- JOB: "intercept -g $DEVNODE | caps2esc | uinput -d $DEVNODE"
  DEVICE:
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ESC]
```

---

### ▶️ 3. **Enable and start `udevmon`**

```bash
sudo systemctl enable --now udevmon
```

This starts the remapping service.

---

### 🧠 Notes

* This will **map Caps Lock to Esc** and **send Escape when tapped**, but **send Ctrl when held**, which is ideal for Vim users.
* You can tweak `caps2esc` behavior if needed.

---

Want it to only act as `Esc` and not `Ctrl` when held? Let me know, and I’ll show how to make a custom script.


## Uninstall it if you don't want it anymore
To **revert the Caps Lock ↔ Esc remap** on **Hyprland (Wayland)** using `interception-tools`, do the following:

---

### 🧹 **1. Stop and disable `udevmon` service**

```bash
sudo systemctl disable --now udevmon
```

---

### 🗑️ **2. Delete the config file**

```bash
sudo rm /etc/interception/udevmon.yaml
```

---

### ❌ **3. (Optional) Uninstall the tools**

If you no longer need the tools:

```bash
sudo pacman -Rns interception-tools interception-caps2esc
```

---

✅ Now your **Caps Lock and Esc keys will behave normally** after a reboot or re-login.
You can also unplug and plug your keyboard back in, or just reboot to reset key mappings.
