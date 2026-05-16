<div align="center">
  <img src="screenshots/demo.png" alt="Finder for Linux" width="800" style="max-width: 100%; height: auto;">
  <br>
  <sup><em>Finder on Ubuntu — click to view full size</em></sup>
</div>

<br>

<h1 align="center">Finder for Linux</h1>

<p align="center">
  A macOS-style Finder launcher that wraps your existing file manager<br>
  with branded desktop actions and custom icons.
</p>

<p align="center">
  <a href="https://github.com/shroomcoder/finder-linux/releases"><img src="https://img.shields.io/github/v/release/shroomcoder/finder-linux?label=version" alt="Version"></a>
  <a href="LICENSE"><img src="https://img.shields.io/github/license/shroomcoder/finder-linux" alt="License"></a>
  <a href="https://github.com/shroomcoder/finder-linux/releases"><img src="https://img.shields.io/badge/download-.deb-blue" alt="Download"></a>
</p>

---

## Screenshots

<!--
  Gallery layout ready for future screenshots.
  Add new .png files to screenshots/ and reference them below.
  Images resize responsively on all devices.
-->

<div align="center">
  <img src="screenshots/demo.png" alt="Finder on Ubuntu" width="800" style="max-width: 100%; height: auto;">
  <br><sup>Finder on Ubuntu — <a href="screenshots/demo.png">view full size</a></sup>
</div>

<br>

<div align="center">
  <table>
    <tr>
      <td align="center" width="50%">
        <!-- KDE Plasma: place screenshot at screenshots/kde.png -->
        <img src="screenshots/demo.png" alt="KDE Plasma" width="400" style="max-width: 100%; height: auto;">
        <br><strong>KDE Plasma</strong>
      </td>
      <td align="center" width="50%">
        <!-- GNOME: place screenshot at screenshots/gnome.png -->
        <img src="screenshots/demo.png" alt="GNOME" width="400" style="max-width: 100%; height: auto;">
        <br><strong>GNOME</strong>
      </td>
    </tr>
    <tr>
      <td align="center" width="50%">
        <!-- XFCE: place screenshot at screenshots/xfce.png -->
        <img src="screenshots/demo.png" alt="XFCE" width="400" style="max-width: 100%; height: auto;">
        <br><strong>XFCE</strong>
      </td>
      <td align="center" width="50%">
        <!-- Windows/Linux Mint/etc: place screenshot at screenshots/<name>.png -->
        <img src="screenshots/demo.png" alt="Your desktop" width="400" style="max-width: 100%; height: auto;">
        <br><strong>Your OS here</strong>
      </td>
    </tr>
  </table>
  <sup>Replace the placeholder screenshots above by adding <code>*.png</code> files to <code>screenshots/</code></sup>
</div>

---

## Features

- **Wrapper script** — detects your installed file manager at runtime (Nemo, Nautilus, Dolphin, Thunar, or fallback to xdg-open)
- **Desktop entry** — appears as "Finder" in your app menu with 8 right-click actions (Desktop, Documents, Downloads, Music, Pictures, Videos, Recents, New Window)
- **macOS-style icons** — 5 icon sizes from 32×32 to 512×512
- **Two install methods** — choose per-user or system-wide

---

## Installation

| Method | How |
|--------|-----|
| **Shell script** (no root) | `cd script/ && ./install.sh` |
| **.deb package** (system-wide) | Download `.deb` from [Releases](https://github.com/shroomcoder/finder-linux/releases) then `sudo dpkg -i finder-linux.deb && sudo apt install -f` |

### Quick comparison

| | Script install | .deb package |
|---|---|---|
| Root required | No | Yes |
| Detection | At install time | At runtime |
| Install location | `~/.local/share` | `/usr` |
| Uninstall | `./uninstall.sh` | `sudo dpkg -r finder-linux` |

---

## Supported File Managers

| Manager | Desktop | Wrapper detects |
|---------|---------|----------------|
| Nemo | Cinnamon | ✓ (1st priority) |
| Nautilus (GNOME Files) | GNOME | ✓ (2nd) |
| Dolphin | KDE Plasma | ✓ (3rd) |
| Thunar | XFCE | ✓ (4th) |
| xdg-open | Any | ✓ (fallback) |

> The wrapper checks for these in order. On first launch, it opens whichever one you have installed.

---

## From Source

If you want to rebuild the `.deb` yourself:

```bash
cd deb/
./build.sh
```

---

## License

MIT — see [LICENSE](LICENSE).
