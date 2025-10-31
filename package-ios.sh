#!/bin/bash

# PlaystorePlugins iOS Packaging Script
# This script packages the iOS project files for distribution

echo "========================================="
echo "PlaystorePlugins iOS Packaging Script"
echo "========================================="
echo ""

# Create distribution directory
mkdir -p distribution

# Create temporary directory for iOS files
TEMP_DIR="temp_ios_package"
mkdir -p "$TEMP_DIR/PlaystorePlugins"

echo "Copying iOS project files..."

# Copy iOS project files
cp -r ios/* "$TEMP_DIR/PlaystorePlugins/"

# Copy build instructions
cp ios/BUILD_INSTRUCTIONS.txt "$TEMP_DIR/"
cp ios/README.md "$TEMP_DIR/"

# Create ZIP file
echo "Creating ZIP archive..."
cd "$TEMP_DIR" || exit 1
zip -r ../distribution/PlaystorePlugins-iOS.zip . -x "*.DS_Store"
cd ..

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "========================================="
echo "Packaging complete!"
echo "========================================="
echo ""
echo "iOS package location: distribution/PlaystorePlugins-iOS.zip"
echo ""
echo "Users will need Xcode to build the iOS app."
echo "Build instructions are included in the package."
