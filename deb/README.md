# Finder for Linux — .deb Package

System-wide installation. Requires root.

---

## Download

Get the latest `.deb` from the [Releases page](https://github.com/shroomcoder/finder-linux/releases).

---

## Install

```bash
sudo dpkg -i finder-linux.deb
sudo apt-get install -f   # resolves dependencies if needed
```

After install, search for **Finder** in your app menu. Right-click the icon for quick-access folder actions.

### What gets installed

| Path | Description |
|------|-------------|
| `/usr/bin/finder` | Runtime wrapper script |
| `/usr/share/applications/finder.desktop` | Desktop entry with 8 actions |
| `/usr/share/icons/hicolor/*/apps/finder.png` | 5 icon sizes (32px – 512px) |

---

## Uninstall

```bash
sudo dpkg -r finder-linux
```

To remove completely including config:

```bash
sudo dpkg -P finder-linux
```

---

## Build from source

If you've cloned the repo and want to build the `.deb` yourself:

```bash
./build.sh
```

Output: `finder-linux.deb` in the current directory.

---

## How it works

At **runtime**, the wrapper script (`/usr/bin/finder`) detects your installed file manager in this order — Nemo, Nautilus, Dolphin, Thunar, then falls back to xdg-open. Desktop actions like "Documents" or "Desktop" are resolved via `--action` flags that expand to `$HOME/<folder>`.
