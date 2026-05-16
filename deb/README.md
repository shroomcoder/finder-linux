# Finder for Linux — .deb Package

## Download

Download the latest `.deb` from the [Releases page](https://github.com/shroomcoder/finder-linux/releases).

## Install

```bash
sudo dpkg -i finder-linux.deb
sudo apt-get install -f   # resolves dependencies if needed
```

## Uninstall

```bash
sudo dpkg -r finder-linux
```

## Build from source

```bash
./build.sh
```

The `.deb` installs a wrapper script (`/usr/bin/finder`) that detects your file manager at runtime, a desktop entry with 8 quick-access actions, and 5 icon sizes.
