#!/usr/bin/env bash

set -eu

echo "======================================"
echo "      Finder for Linux Installer"
echo "======================================"
echo ""

# Detect available file manager
if command -v nemo >/dev/null 2>&1; then
  FILE_MANAGER="nemo"
elif command -v nautilus >/dev/null 2>&1; then
  FILE_MANAGER="nautilus"
elif command -v dolphin >/dev/null 2>&1; then
  FILE_MANAGER="dolphin"
elif command -v thunar >/dev/null 2>&1; then
  FILE_MANAGER="thunar"
else
  FILE_MANAGER="xdg-open"
fi

case "$FILE_MANAGER" in
  nemo|nautilus|dolphin|thunar|xdg-open) ;;
  *) echo "FATAL: unexpected file manager '$FILE_MANAGER'" >&2; exit 1 ;;
esac

echo "Detected file manager: $FILE_MANAGER"
echo ""

# Create required directories
mkdir -p ~/.local/share/icons/hicolor ~/.local/share/applications

# Install icons
echo "Installing icons..."

cp -r icons/hicolor/* ~/.local/share/icons/hicolor/

echo "Icons installed."
echo ""

# Create Finder launcher
echo "Creating launcher..."

cat >~/.local/share/applications/finder.desktop <<EOF
[Desktop Entry]
Name=Finder
Comment=Browse Files
Exec=sh -c 'exec "\$1" "\$HOME"' -- $FILE_MANAGER
Icon=finder
Terminal=false
Type=Application
Categories=Utility;FileManager;
StartupNotify=true
StartupWMClass=$FILE_MANAGER
Actions=new-window;desktop;documents;downloads;music;pictures;videos;recents;

[Desktop Action new-window]
Name=New Finder Window
Exec=sh -c 'exec "\$1" "\$HOME"' -- $FILE_MANAGER

[Desktop Action desktop]
Name=Desktop
Exec=sh -c 'exec "\$1" "\$HOME/Desktop"' -- $FILE_MANAGER

[Desktop Action documents]
Name=Documents
Exec=sh -c 'exec "\$1" "\$HOME/Documents"' -- $FILE_MANAGER

[Desktop Action downloads]
Name=Downloads
Exec=sh -c 'exec "\$1" "\$HOME/Downloads"' -- $FILE_MANAGER

[Desktop Action music]
Name=Music
Exec=sh -c 'exec "\$1" "\$HOME/Music"' -- $FILE_MANAGER

[Desktop Action pictures]
Name=Pictures
Exec=sh -c 'exec "\$1" "\$HOME/Pictures"' -- $FILE_MANAGER

[Desktop Action videos]
Name=Videos
Exec=sh -c 'exec "\$1" "\$HOME/Videos"' -- $FILE_MANAGER

[Desktop Action recents]
Name=Recents
Exec=sh -c 'exec "\$1" recent:///' -- $FILE_MANAGER
EOF

echo "Launcher created."
echo ""

# Update icon cache
if command -v gtk-update-icon-cache >/dev/null 2>&1; then
  echo "Updating icon cache..."
  gtk-update-icon-cache ~/.local/share/icons/hicolor || echo "Warning: icon cache update failed"
fi

# Update desktop database
if command -v update-desktop-database >/dev/null 2>&1; then
  echo "Updating desktop database..."
  update-desktop-database ~/.local/share/applications || echo "Warning: desktop DB update failed"
fi

# Refresh Plank if installed
if command -v plank >/dev/null 2>&1; then
  echo "Finder icons may not appear in Plank until it is restarted."
  read -r -p "Restart Plank now? [y/N] " REPLY
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    pkill plank >/dev/null 2>&1 || true
    plank >/dev/null 2>&1 &
    echo "Plank restarted."
  fi
fi

echo ""
echo "======================================"
echo " Finder installed successfully!"
echo "======================================"
echo ""
echo "You can now:"
echo "- Search for Finder in your app menu"
echo "- Add Finder to your dock"
echo "- Use right-click quick folder actions"
echo ""
echo "Enjoy 🍎"
