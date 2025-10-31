# PlaystorePlugins Website

## WordPress.com Integration Guide

This website is ready to be uploaded to WordPress.com. Follow these steps:

### Method 1: Using WordPress Custom HTML

1. Log in to your WordPress.com account
2. Go to your site's dashboard
3. Navigate to Pages > Add New
4. Click on the three dots menu and select "Edit as HTML"
5. Copy the entire content of `index.html` and paste it
6. Publish the page

### Method 2: Using a Custom Theme

1. Create a new folder called `playstoreplugins-theme`
2. Copy `index.html`, `style.css`, and `script.js` into this folder
3. Create a `style.css` file in the root with WordPress theme headers:

```css
/*
Theme Name: PlaystorePlugins
Theme URI: https://playstoreplugins.com
Description: Landing page for PlaystorePlugins
Version: 1.0
Author: PlaystorePlugins
Author URI: mailto:playstoreplugins@gmail.com
*/
```

4. Zip the folder and upload via Appearance > Themes > Add New

### Method 3: Direct File Upload

1. Use an FTP client or WordPress File Manager plugin
2. Upload all files to your WordPress installation
3. Access the page directly via URL

### Setting Up Downloads

1. Create a `downloads` folder in your WordPress media library
2. Upload the APK and iOS ZIP files
3. Update the download links in `index.html`:
   - Replace `downloads/PlaystorePlugins-Android.apk` with the actual URL
   - Replace `downloads/PlaystorePlugins-iOS.zip` with the actual URL

### Customization

- All colors can be changed in the `:root` section of `style.css`
- Update contact email in both HTML and footer
- Add Google Analytics by inserting tracking code before `</head>`

### Features

- Fully responsive design
- Smooth scrolling navigation
- Download tracking
- Animated sections
- Mobile-friendly
- SEO optimized

### Browser Support

- Chrome (latest)
- Firefox (latest)
- Safari (latest)
- Edge (latest)
- Mobile browsers

### Contact

For support: playstoreplugins@gmail.com
