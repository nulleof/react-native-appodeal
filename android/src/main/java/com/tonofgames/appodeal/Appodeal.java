package com.tonofgames.appodeal;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.Map;
import java.util.HashMap;
import android.util.Log;

public class Appodeal extends ReactContextBaseJavaModule {

    private static final String USELESS_KEY = "USELESS";
    private static final String USELESS_VALUE = "Useless value";

    public Appodeal(ReactApplicationContext reactContext) {
        super(reactContext);
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
}
