@echo off
REM PlaystorePlugins Website Packaging Script for Windows
REM This script packages the website for WordPress deployment

echo =========================================
echo PlaystorePlugins Website Packaging
echo =========================================
echo.

REM Create distribution directory
if not exist "distribution" mkdir "distribution"

REM Create temporary directory for website files
set TEMP_DIR=temp_website_package
if exist "%TEMP_DIR%" rmdir /s /q "%TEMP_DIR%"
mkdir "%TEMP_DIR%\playstoreplugins-website"

echo Copying website files...

REM Copy website files
copy "website\index.html" "%TEMP_DIR%\playstoreplugins-website\"
copy "website\style.css" "%TEMP_DIR%\playstoreplugins-website\"
copy "website\script.js" "%TEMP_DIR%\playstoreplugins-website\"
copy "website\README.md" "%TEMP_DIR%\playstoreplugins-website\"

REM Create downloads directory placeholder
mkdir "%TEMP_DIR%\playstoreplugins-website\downloads"
echo Place your APK and iOS ZIP files here > "%TEMP_DIR%\playstoreplugins-website\downloads\README.txt"

REM Create ZIP file
echo Creating ZIP archive...
powershell -command "Compress-Archive -Path '%TEMP_DIR%\*' -DestinationPath 'distribution\PlaystorePlugins-Website.zip' -Force"

REM Clean up
rmdir /s /q "%TEMP_DIR%"

echo.
echo =========================================
echo Packaging complete!
echo =========================================
echo.
echo Website package location: distribution\PlaystorePlugins-Website.zip
echo.
echo Upload this to WordPress.com to deploy your website.
