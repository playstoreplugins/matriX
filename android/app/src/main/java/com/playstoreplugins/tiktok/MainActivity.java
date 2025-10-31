package com.playstoreplugins.tiktok;

import android.app.Activity;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.net.Uri;
import android.os.Build;
import android.os.Bundle;
import android.os.PowerManager;
import android.provider.Settings;
import android.view.View;
import android.widget.Button;
import android.widget.Switch;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity {

    private Switch keepScreenOnSwitch;
    private Switch backgroundPlaybackSwitch;
    private Button launchTikTokButton;
    private Button stopServiceButton;
    private TextView statusText;
    private PowerManager powerManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        powerManager = (PowerManager) getSystemService(POWER_SERVICE);

        initializeViews();
        setupListeners();
        checkBatteryOptimization();
    }

    private void initializeViews() {
        keepScreenOnSwitch = findViewById(R.id.keepScreenOnSwitch);
        backgroundPlaybackSwitch = findViewById(R.id.backgroundPlaybackSwitch);
        launchTikTokButton = findViewById(R.id.launchTikTokButton);
        stopServiceButton = findViewById(R.id.stopServiceButton);
        statusText = findViewById(R.id.statusText);
    }

    private void setupListeners() {
        keepScreenOnSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            if (isChecked) {
                getWindow().addFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                updateStatus("Screen will stay on");
            } else {
                getWindow().clearFlags(android.view.WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
                updateStatus("Screen timeout enabled");
            }
        });

        backgroundPlaybackSwitch.setOnCheckedChangeListener((buttonView, isChecked) -> {
            if (isChecked) {
                startKeepAliveService();
            } else {
                stopKeepAliveService();
            }
        });

        launchTikTokButton.setOnClickListener(v -> launchTikTok());
        stopServiceButton.setOnClickListener(v -> stopKeepAliveService());
    }

    private void startKeepAliveService() {
        Intent serviceIntent = new Intent(this, TikTokKeepAliveService.class);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            startForegroundService(serviceIntent);
        } else {
            startService(serviceIntent);
        }
        updateStatus("Keep-alive service started");
    }

    private void stopKeepAliveService() {
        Intent serviceIntent = new Intent(this, TikTokKeepAliveService.class);
        stopService(serviceIntent);
        backgroundPlaybackSwitch.setChecked(false);
        updateStatus("Keep-alive service stopped");
    }

    private void launchTikTok() {
        PackageManager pm = getPackageManager();
        Intent launchIntent = pm.getLaunchIntentForPackage("com.zhiliaoapp.musically");
        
        if (launchIntent != null) {
            startActivity(launchIntent);
            updateStatus("Launching TikTok...");
        } else {
            Toast.makeText(this, "TikTok not installed. Opening Play Store...", Toast.LENGTH_LONG).show();
            openTikTokInPlayStore();
        }
    }

    private void openTikTokInPlayStore() {
        try {
            Intent intent = new Intent(Intent.ACTION_VIEW, Uri.parse("market://details?id=com.zhiliaoapp.musically"));
            startActivity(intent);
        } catch (android.content.ActivityNotFoundException e) {
            Intent intent = new Intent(Intent.ACTION_VIEW, 
                Uri.parse("https://play.google.com/store/apps/details?id=com.zhiliaoapp.musically"));
            startActivity(intent);
        }
    }

    private void checkBatteryOptimization() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            String packageName = getPackageName();
            if (!powerManager.isIgnoringBatteryOptimizations(packageName)) {
                Intent intent = new Intent(Settings.ACTION_REQUEST_IGNORE_BATTERY_OPTIMIZATIONS);
                intent.setData(Uri.parse("package:" + packageName));
                startActivity(intent);
            }
        }
    }

    private void updateStatus(String message) {
        statusText.setText(message);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        if (!backgroundPlaybackSwitch.isChecked()) {
            stopKeepAliveService();
        }
    }
}
