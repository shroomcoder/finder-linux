# Finder for Linux — Script Install

Per-user installation. No root required.

---

## Install

```bash
./install.sh
```

The script detects your installed file manager (Nemo, Nautilus, Dolphin, Thunar) and creates a branded "Finder" launcher in `~/.local/share/applications/`.

After install, search for **Finder** in your app menu or add it to your dock.

### What gets installed

| Path | Description |
|------|-------------|
| `~/.local/share/applications/finder.desktop` | Desktop entry with 8 right-click actions |
| `~/.local/share/icons/hicolor/*/apps/finder.png` | 5 icon sizes (32px – 512px) |

---

## Uninstall

```bash
./uninstall.sh
```

Removes the desktop entry and all icon files from `~/.local/share/`.

---

## How it works

The script generates a desktop file with `Exec=sh -c 'exec "$1" ...' -- <detected_fm>` — the file manager is detected once at install time and baked into the launcher.
