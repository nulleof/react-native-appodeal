package com.tonofgames.appodeal;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.Map;
import java.util.HashMap;
import android.util.Log;

import com.appodeal.ads.Appodeal;

public class AppodealWrapper extends ReactContextBaseJavaModule {

    private static final String USELESS_KEY = "USELESS";
    private static final String USELESS_VALUE = "Useless value";

    public Appodeal(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addLifecycleEventListener(this);
    }

    @Override
    public void onHostResume() {
        super.onHostResume();
        Appodeal.onResume(this, Appodeal.BANNER);
    }

    @Override
    public void onHostPause() {
        super.onHostPause();
    }

    @Override
    public void onHostDestroy() {
        super.onHostDestroy();
    }

    @Override
    public String getName() {
        return "Appodeal";
    }

    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        constants.put(USELESS_KEY, USELESS_VALUE);
        return constants;
    }

    @ReactMethod
    public void debug(String message) {
        Log.d("Appodeal native log", message);
    }

    @ReactMethod
    public void init(String apiKey) {
        Appodeal.disableLocationPermissionCheck();
        Appodeal.initialize(this, appKey, Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO | Appodeal.BANNER | Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void showInterstitial() {
        Appodeal.show(getReactApplicationContext(), Appodeal.INTERSTITIAL);
    }

    @ReactMethod
    public void isInterstitialLoaded() {
        return Appodeal.isLoaded(Appodeal.INTERSTITIAL));
    }

    @ReactMethod
    public void showSkippableVideo() {
        Appodeal.show(getReactApplicationContext(), Appodeal.SKIPPABLE_VIDEO);
    }

    @ReactMethod
    public void isSkippableVideoLoaded() {
        return Appodeal.isLoaded(Appodeal.SKIPPABLE_VIDEO);
    }

    @ReactMethod
    public void showRewardedVideo() {
        Appodeal.show(getReactApplicationContext(), Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void isRewardedVideoLoaded() {
        return Appodeal.isLoaded(Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void showBannerBottom() {
        Appodeal.show(this, Appodeal.BANNER_BOTTOM);
    }

    @ReactMethod
    public void hideBanner() {
        Appodeal.hide(this, Appodeal.BANNER);
    }

    @ReactMethod
    public void isBannerLoadied() {
        return Appodeal.isLoaded(Appodeal.BANNER);
    }
}
