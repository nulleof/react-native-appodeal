package com.tonofgames.appodeal;

import com.appodeal.ads.BannerCallbacks;
import com.facebook.react.bridge.Arguments;
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

import android.support.annotation.Nullable;
import android.util.Log;

import com.appodeal.ads.Appodeal;
import com.appodeal.ads.UserSettings;
import com.facebook.react.bridge.WritableMap;
import com.facebook.react.modules.core.DeviceEventManagerModule;

public class AppodealWrapper extends ReactContextBaseJavaModule implements LifecycleEventListener, ActivityEventListener {

    private UserSettings userSettings;

    private int bannerHeight = 0;

    public enum Events {
        EVENT_SIZE_CHANGE("onSizeChange");

        private final String mName;

        Events(final String name) {
            mName = name;
        }

        @Override
        public String toString() {
            return mName;
        }
    }

    public AppodealWrapper(ReactApplicationContext reactContext) {
        super(reactContext);
        reactContext.addLifecycleEventListener(this);
        reactContext.addActivityEventListener(this);
        this.userSettings = Appodeal.getUserSettings(getReactApplicationContext());
    }

    @Override
    public void onNewIntent(Intent intent) {

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
        return "RCTAppodeal";
    }

    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        return constants;
    }

    public void onActivityResult(Activity activity, final int requestCode, final int resultCode, final Intent intent) {

    }

    @ReactMethod
    public void setAge(int age) {
      this.userSettings.setAge(age);
    }

    @ReactMethod
    public void setBirthday(String bdate) {
      this.userSettings.setBirthday(bdate);
    }

    @ReactMethod
    public void setEmail(String email) {
      this.userSettings.setEmail(email);
    }

    @ReactMethod
    public void setGender(String gender) {
      if (gender == "female") {
        this.userSettings.setGender(UserSettings.Gender.FEMALE);
      } else if (gender == "male") {
        this.userSettings.setGender(UserSettings.Gender.MALE);
      } else {
        this.userSettings.setGender(UserSettings.Gender.OTHER);
      }
    }

    @ReactMethod
    public void setInterests(String interests) {
      this.userSettings.setInterests(interests);
    }

    @ReactMethod
    public void setRelation (String relation) {
      switch (relation) {
        case "dating":    this.userSettings.setRelation(UserSettings.Relation.DATING);
                          break;
        case "engaged":   this.userSettings.setRelation(UserSettings.Relation.ENGAGED);
                          break;
        case "married":   this.userSettings.setRelation(UserSettings.Relation.MARRIED);
                          break;
        case "searching": this.userSettings.setRelation(UserSettings.Relation.SEARCHING);
                          break;
        case "single":    this.userSettings.setRelation(UserSettings.Relation.SINGLE);
                          break;
        case "other":     this.userSettings.setRelation(UserSettings.Relation.OTHER);
                          break;
      }
    }

    @ReactMethod
    public void setAlcohol (String relation) {
      switch (relation) {
        case "negative": this.userSettings.setAlcohol(UserSettings.Alcohol.NEGATIVE);
                         break;
        case "neutral":  this.userSettings.setAlcohol(UserSettings.Alcohol.NEUTRAL);
                         break;
        case "positive": this.userSettings.setAlcohol(UserSettings.Alcohol.POSITIVE);
                         break;
      }
    }

    @ReactMethod
    public void setSmoking (String relation) {
      switch (relation) {
        case "negative": this.userSettings.setSmoking(UserSettings.Smoking.NEGATIVE);
                         break;
        case "neutral":  this.userSettings.setSmoking(UserSettings.Smoking.NEUTRAL);
                         break;
        case "positive": this.userSettings.setSmoking(UserSettings.Smoking.POSITIVE);
                         break;
      }
    }

    @ReactMethod
    public void init(String apiKey) {

        Appodeal.setBannerCallbacks(new BannerCallbacks() {
            @Override
            public void onBannerLoaded(int height, boolean isPrecache) {
                //send event with banner size changed
                bannerHeight = height;

                WritableMap event = Arguments.createMap();
                event.putString("height", Integer.toString(height));
                sendEvent(Events.EVENT_SIZE_CHANGE.toString(), event);
            }

            @Override
            public void onBannerFailedToLoad() {

            }

            @Override
            public void onBannerShown() {

            }

            @Override
            public void onBannerClicked() {

            }
        });

        Appodeal.disableLocationPermissionCheck();
        Appodeal.confirm(Appodeal.SKIPPABLE_VIDEO);
        Appodeal.initialize(getCurrentActivity(), apiKey, Appodeal.INTERSTITIAL | Appodeal.SKIPPABLE_VIDEO | Appodeal.BANNER | Appodeal.REWARDED_VIDEO);
    }

    @ReactMethod
    public void disableNetwork(String network) {
        try {
          Appodeal.disableNetwork(getReactApplicationContext(), network);
        } catch(NullPointerException e) {
          // something went wrong...
        }
    }

    @ReactMethod
    public void setTesting(Boolean isTesting) {
        Appodeal.setTesting(isTesting);
    }

    @ReactMethod
    public void setLogging(Boolean isLogging) {
        Appodeal.setLogging(isLogging);
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
    public void showBannerTop() {
        Appodeal.show(getCurrentActivity(), Appodeal.BANNER_TOP);
    }

    @ReactMethod
    public void hideBanner() {
        Appodeal.hide(getCurrentActivity(), Appodeal.BANNER);
    }

    @ReactMethod
    public void isBannerLoaded(Callback booleanCallback) {
        booleanCallback.invoke(Appodeal.isLoaded(Appodeal.BANNER));
    }

    @ReactMethod
    public void getBannerHeight(Callback integerCallback) {
        integerCallback.invoke(bannerHeight);
    }

    private void sendEvent(String eventName, @Nullable WritableMap params) {
        getReactApplicationContext().getJSModule(DeviceEventManagerModule.RCTDeviceEventEmitter.class).emit(eventName, params);
    }
}
