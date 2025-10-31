#!/bin/bash

# PlaystorePlugins Website Packaging Script
# This script packages the website for WordPress deployment

echo "========================================="
echo "PlaystorePlugins Website Packaging"
echo "========================================="
echo ""

# Create distribution directory
mkdir -p distribution

# Create temporary directory for website files
TEMP_DIR="temp_website_package"
mkdir -p "$TEMP_DIR/playstoreplugins-website"

echo "Copying website files..."

# Copy website files
cp website/index.html "$TEMP_DIR/playstoreplugins-website/"
cp website/style.css "$TEMP_DIR/playstoreplugins-website/"
cp website/script.js "$TEMP_DIR/playstoreplugins-website/"
cp website/README.md "$TEMP_DIR/playstoreplugins-website/"

# Create downloads directory placeholder
mkdir -p "$TEMP_DIR/playstoreplugins-website/downloads"
echo "Place your APK and iOS ZIP files here" > "$TEMP_DIR/playstoreplugins-website/downloads/README.txt"

# Create ZIP file
echo "Creating ZIP archive..."
cd "$TEMP_DIR" || exit 1
zip -r ../distribution/PlaystorePlugins-Website.zip . -x "*.DS_Store"
cd ..

# Clean up
rm -rf "$TEMP_DIR"

echo ""
echo "========================================="
echo "Packaging complete!"
echo "========================================="
echo ""
echo "Website package location: distribution/PlaystorePlugins-Website.zip"
echo ""
echo "Upload this to WordPress.com to deploy your website."
