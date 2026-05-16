#!/usr/bin/env bash

set -eu

echo "======================================"
echo "    Finder for Linux Uninstaller"
echo "======================================"
echo ""

echo "This will remove the Finder launcher and icons from ~/.local/share/"
read -r -p "Continue? [y/N] " REPLY
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
  echo "Cancelled."
  exit 0
fi

# Remove launcher
echo "Removing launcher..."

rm -f ~/.local/share/applications/finder.desktop

echo "Launcher removed."
echo ""

# Remove icons
echo "Removing icons..."

find ~/.local/share/icons/hicolor -name "finder.png" -delete 2>/dev/null || true

echo "Icons removed."
echo ""

# Refresh icon cache
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
  echo "Refreshing icon cache..."
  gtk-update-icon-cache ~/.local/share/icons/hicolor || echo "Warning: icon cache update failed"
fi

# Refresh desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
  echo "Refreshing desktop database..."
  update-desktop-database ~/.local/share/applications || echo "Warning: desktop DB update failed"
fi

# Restart plank if installed
if command -v plank >/dev/null 2>&1; then
  echo "Finder icons may not be fully removed from Plank until it is restarted."
  read -r -p "Restart Plank now? [y/N] " REPLY
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    pkill plank >/dev/null 2>&1 || true
    plank >/dev/null 2>&1 &
    echo "Plank restarted."
  fi
fi

echo ""
echo "======================================"
echo " Finder removed successfully!"
echo "======================================"
echo ""
