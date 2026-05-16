# Finder for Linux

A macOS-style Finder launcher for Linux. Wraps your existing file manager
with quick-access desktop actions and a custom icon set.

## Installation Methods

| Method | Folder | Instructions |
|--------|--------|--------------|
| **Shell script** | [`script/`](script/) | `cd script && ./install.sh` |
| **.deb package** | [`deb/`](deb/) | Download from [Releases](https://github.com/shroomcoder/finder-linux/releases) or build with `./build.sh` in [`deb/`](deb/) |

### Quick comparison

| | Script | .deb |
|--|--------|------|
| Requires root | No | Yes |
| File manager detection | At install time | At runtime |
| System-wide install | No (`~/.local`) | Yes (`/usr`) |
| Removal | `uninstall.sh` | `sudo dpkg -r finder-linux` |

## License

MIT
