package com.tonofgames.appodeal;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.LifecycleEventListener;
import com.facebook.react.bridge.ActivityEventListener;

import android.app.Activity;
import android.content.Intent;
import java.util.Map;
import java.util.HashMap;
import android.util.Log;

import com.appodeal.ads.Appodeal;

public class AppodealWrapper extends ReactContextBaseJavaModule implements LifecycleEventListener, ActivityEventListener {

    private static final String USELESS_KEY = "USELESS";
    private static final String USELESS_VALUE = "Useless value";


    public AppodealWrapper(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addLifecycleEventListener(this);
        reactContext.addActivityEventListener(this);
    }

    @Override
    public void onHostResume() {
        Appodeal.onResume(getCurrentActivity(), Appodeal.BANNER);
    }

    @Override
    public void onHostPause() {

    }

    @Override
    public void onHostDestroy() {

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

    public void onActivityResult(final int requestCode, final int resultCode, final Intent intent) {

    }

    @ReactMethod
    public void init(String apiKey) {
        Appodeal.disableLocationPermissionCheck();
        Appodeal.initialize(getCurrentActivity(), apiKey, Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO | Appodeal.BANNER | Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void showInterstitial() {
        Appodeal.show(getCurrentActivity(), Appodeal.INTERSTITIAL);
    }

    @ReactMethod
    public void isInterstitialLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.INTERSTITIAL));
    }

    @ReactMethod
    public void showSkippableVideo() {
        Appodeal.show(getCurrentActivity(), Appodeal.SKIPPABLE_VIDEO);
    }

    @ReactMethod
    public void isSkippableVideoLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.SKIPPABLE_VIDEO));
    }

    @ReactMethod
    public void showRewardedVideo() {
        Appodeal.show(getCurrentActivity(), Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void isRewardedVideoLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.REWARDED_VIDEO));
    }

    @ReactMethod
    public void showBannerBottom() {
        Appodeal.show(getCurrentActivity(), Appodeal.BANNER_BOTTOM);
    }

    @ReactMethod
    public void hideBanner() {
        Appodeal.hide(getCurrentActivity(), Appodeal.BANNER);
    }

    @ReactMethod
    public void isBannerLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.BANNER));
    }
}
