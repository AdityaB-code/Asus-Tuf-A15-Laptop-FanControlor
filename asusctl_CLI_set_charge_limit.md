To **auto-set the charge limit (e.g., 80%) on boot**, follow these steps:

---

### ✅ 1. **Create a systemd service**

#### Command:

```bash
sudo nano /etc/systemd/system/asus-charge-limit.service
```

#### Paste this:

```ini
[Unit]
Description=Set ASUS Battery Charge Limit
After=multi-user.target

[Service]
Type=oneshot
ExecStart=/usr/bin/asusctl -c 80

[Install]
WantedBy=multi-user.target
```

---

### ✅ 2. **Enable the service**

```bash
sudo systemctl enable asus-charge-limit.service
```

---

### ✅ 3. **Run it manually once (optional)**

```bash
sudo systemctl start asus-charge-limit.service
```

---

Now every time your system boots, the battery limit will automatically be set to **80%**.

Let me know if you want a GUI toggle or to switch limits based on profiles.
