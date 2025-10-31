@echo off
REM PlaystorePlugins Android Build Script for Windows
REM This script builds the Android APK

echo =========================================
echo PlaystorePlugins Android Build Script
echo =========================================
echo.

REM Check if Android SDK is installed
if "%ANDROID_HOME%"=="" (
    echo ERROR: ANDROID_HOME is not set
    echo Please install Android SDK and set ANDROID_HOME environment variable
    exit /b 1
)

echo Android SDK found at: %ANDROID_HOME%
echo.

REM Navigate to android directory
cd android
if errorlevel 1 exit /b 1

echo Cleaning previous builds...
call gradlew.bat clean

echo.
echo Building debug APK...
call gradlew.bat assembleDebug

if errorlevel 0 (
    echo.
    echo =========================================
    echo Build successful!
    echo =========================================
    echo.
    echo APK location: android\app\build\outputs\apk\debug\app-debug.apk
    echo.
    
    REM Copy APK to distribution folder
    if not exist "..\distribution" mkdir "..\distribution"
    copy "app\build\outputs\apk\debug\app-debug.apk" "..\distribution\PlaystorePlugins-Android.apk"
    
    echo APK copied to: distribution\PlaystorePlugins-Android.apk
    echo.
    echo To build release APK, run: gradlew.bat assembleRelease
    echo (Note: Release build requires signing configuration)
) else (
    echo.
    echo =========================================
    echo Build failed!
    echo =========================================
    exit /b 1
)

cd ..
