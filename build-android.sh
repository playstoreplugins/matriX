#!/bin/bash

# PlaystorePlugins Android Build Script
# This script builds the Android APK

echo "========================================="
echo "PlaystorePlugins Android Build Script"
echo "========================================="
echo ""

# Check if Android SDK is installed
if [ -z "$ANDROID_HOME" ]; then
    echo "ERROR: ANDROID_HOME is not set"
    echo "Please install Android SDK and set ANDROID_HOME environment variable"
    exit 1
fi

echo "Android SDK found at: $ANDROID_HOME"
echo ""

# Navigate to android directory
cd android || exit 1

echo "Cleaning previous builds..."
./gradlew clean

echo ""
echo "Building debug APK..."
./gradlew assembleDebug

if [ $? -eq 0 ]; then
    echo ""
    echo "========================================="
    echo "Build successful!"
    echo "========================================="
    echo ""
    echo "APK location: android/app/build/outputs/apk/debug/app-debug.apk"
    echo ""
    
    # Copy APK to distribution folder
    mkdir -p ../distribution
    cp app/build/outputs/apk/debug/app-debug.apk ../distribution/PlaystorePlugins-Android.apk
    
    echo "APK copied to: distribution/PlaystorePlugins-Android.apk"
    echo ""
    echo "To build release APK, run: ./gradlew assembleRelease"
    echo "(Note: Release build requires signing configuration)"
else
    echo ""
    echo "========================================="
    echo "Build failed!"
    echo "========================================="
    exit 1
fi
