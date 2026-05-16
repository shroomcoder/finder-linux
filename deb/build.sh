#!/bin/bash
set -eu

BUILD_DIR="$(mktemp -d)"
OUTPUT="$(dirname "$0")/finder-linux.deb"
SCRIPT_DIR="$(dirname "$0")"

mkdir -p "$BUILD_DIR/DEBIAN"
mkdir -p "$BUILD_DIR/usr/bin"
mkdir -p "$BUILD_DIR/usr/share/applications"

# Install wrapper
cp "$SCRIPT_DIR/finder" "$BUILD_DIR/usr/bin/"
chmod 755 "$BUILD_DIR/usr/bin/finder"

# Install desktop file
cp "$SCRIPT_DIR/finder.desktop" "$BUILD_DIR/usr/share/applications/"
chmod 644 "$BUILD_DIR/usr/share/applications/finder.desktop"

# Install icons
for size in 32 48 128 256 512; do
  mkdir -p "$BUILD_DIR/usr/share/icons/hicolor/${size}x${size}/apps"
  cp "$SCRIPT_DIR/icons/hicolor/${size}x${size}/apps/finder.png" \
     "$BUILD_DIR/usr/share/icons/hicolor/${size}x${size}/apps/"
done

# Install DEBIAN control files
cp "$SCRIPT_DIR/DEBIAN/control" "$BUILD_DIR/DEBIAN/"
cp "$SCRIPT_DIR/DEBIAN/postinst" "$BUILD_DIR/DEBIAN/"
chmod 755 "$BUILD_DIR/DEBIAN/postinst"

# Generate md5sums
cd "$BUILD_DIR"
find . -type f -not -path './DEBIAN/*' -exec md5sum {} \; > DEBIAN/md5sums
chmod 644 DEBIAN/md5sums
cd - >/dev/null

# Build .deb
dpkg-deb -b --root-owner-group "$BUILD_DIR" "$OUTPUT"

rm -rf "$BUILD_DIR"
echo "Built: $OUTPUT"
