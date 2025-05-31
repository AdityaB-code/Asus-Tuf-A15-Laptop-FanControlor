The **ROG Control Center** (also known as **ASUS ROG Gaming Center**, Armoury Crate, or `rog-control-center`) is typically software available for Windows. On Linux, there is **limited support** for ASUS ROG-specific features via open-source tools, and not an official "ROG Control Center" per se.

But for Arch-based systems using `yay`, there are community packages that **partially support** ASUS ROG features like fan control, keyboard RGB, etc.

### ✅ Step-by-Step: Install ROG-related tools using `yay`

#### 1. **Update your system first**

```bash
sudo pacman -Syu
```

#### 2. **Install yay if not already installed**

```bash
sudo pacman -S yay
```

#### 3. **Search for ROG-related packages**

```bash
yay -Ss rog
```

You'll likely see packages like:

* `rog-control-center-git`
* `asusctl`
* `supergfxctl`
* `rog-core`
* `linux-asus`
* `asus-nb-ctrl`

#### 4. **Install rog-control-center**

```bash
yay -S rog-control-center-git
```

if above command shows error then use this one
```bash
yay -S rog-control-center
```


> This will fetch the latest development version from GitHub. You might be prompted to review the PKGBUILD — just press `Enter` to continue, or `n` if you don’t want to edit it.

#### 5. **Enable the rog-control-center service (if it has one)**

```bash
systemctl --user enable --now rog-control-center
```

(If it installs as a user service.)

#### 6. **Optional: Install supporting tools**

```bash
yay -S asusctl supergfxctl
```

Then enable them:

```bash
sudo systemctl enable --now asusd
sudo systemctl enable --now supergfxd
```

---
