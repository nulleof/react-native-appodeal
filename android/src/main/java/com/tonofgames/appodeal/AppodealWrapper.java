package com.tonofgames.appodeal;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.Callback;
import com.facebook.react.bridge.ReactMethod;
import com.facebook.react.bridge.LifecycleEventListener;

import android.app.Activity;
import java.util.Map;
import java.util.HashMap;
import android.util.Log;

import com.appodeal.ads.Appodeal;

public class AppodealWrapper extends ReactContextBaseJavaModule implements LifecycleEventListener {

    private static final String USELESS_KEY = "USELESS";
    private static final String USELESS_VALUE = "Useless value";

    private Activity mActivity = null;

    public AppodealWrapper(ReactApplicationContext reactContext, Activity activity) {
        super(reactContext);
        mActivity = activity;
        reactContext.addLifecycleEventListener(this);
    }

    @Override
    public void onHostResume() {
        Appodeal.onResume(mActivity, Appodeal.BANNER);
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

    @ReactMethod
    public void init(String apiKey) {
        Appodeal.disableLocationPermissionCheck();
        Appodeal.initialize(mActivity, apiKey, Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO | Appodeal.BANNER | Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void showInterstitial() {
        Appodeal.show(mActivity, Appodeal.INTERSTITIAL);
    }

    @ReactMethod
    public void isInterstitialLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.INTERSTITIAL));
    }

    @ReactMethod
    public void showSkippableVideo() {
        Appodeal.show(mActivity, Appodeal.SKIPPABLE_VIDEO);
    }

    @ReactMethod
    public void isSkippableVideoLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.SKIPPABLE_VIDEO));
    }

    @ReactMethod
    public void showRewardedVideo() {
        Appodeal.show(mActivity, Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void isRewardedVideoLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.REWARDED_VIDEO));
    }

    @ReactMethod
    public void showBannerBottom() {
        Appodeal.show(mActivity, Appodeal.BANNER_BOTTOM);
    }

    @ReactMethod
    public void hideBanner() {
        Appodeal.hide(mActivity, Appodeal.BANNER);
    }

    @ReactMethod
    public void isBannerLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.BANNER));
    }
}
