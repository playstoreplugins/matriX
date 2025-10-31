@echo off
REM PlaystorePlugins iOS Packaging Script for Windows
REM This script packages the iOS project files for distribution

echo =========================================
echo PlaystorePlugins iOS Packaging Script
echo =========================================
echo.

REM Create distribution directory
if not exist "distribution" mkdir "distribution"

REM Create temporary directory for iOS files
set TEMP_DIR=temp_ios_package
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%\PlaystorePlugins"

echo Copying iOS project files...

REM Copy iOS project files
xcopy /E /I /Y "ios\*" "%TEMP_DIR%\PlaystorePlugins\"

REM Copy build instructions
copy "ios\BUILD_INSTRUCTIONS.txt" "%TEMP_DIR%\"
copy "ios\README.md" "%TEMP_DIR%\"

REM Create ZIP file (requires PowerShell)
echo Creating ZIP archive...
powershell -command "Compress-Archive -Path '%TEMP_DIR%\*' -DestinationPath 'distribution\PlaystorePlugins-iOS.zip' -Force"

REM Clean up
rmdir /s /q "%TEMP_DIR%"

echo.
echo =========================================
echo Packaging complete!
echo =========================================
echo.
echo iOS package location: distribution\PlaystorePlugins-iOS.zip
echo.
echo Users will need Xcode to build the iOS app.
echo Build instructions are included in the package.
