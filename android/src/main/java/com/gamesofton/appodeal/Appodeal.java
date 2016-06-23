package com.gamesofton.appodeal;

import com.facebook.react.bridge.NativeModule;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import java.util.Map;
import android.util.Log;

public class AppodealModule extends ReactContextBaseJavaModule {

    private static final String USELESS_KEY = "USELESS";
    private static final String USELESS_VALUE = "Useless value";

    public AppodealModule(ReactApplicationContext reactContext) {
        super(reactContext);
    }

    @Override
    public String getName() {
        return "Appodeal";
    }

    @Override
    public Map<String, Object> getConstants() {
        final Map<String, Object> constants = new HashMap<>();
        constants.put(USELESS, USELESS_VALUE);
        return constants;
    }

    @ReactMethod
    public void debug(String message, int duration) {
        Log.d("Simple tag", "Appodeal simple tag");
    }
}
