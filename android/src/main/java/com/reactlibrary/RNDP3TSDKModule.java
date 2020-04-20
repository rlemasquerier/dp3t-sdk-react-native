package com.reactlibrary;

import com.facebook.react.bridge.Promise;
import com.facebook.react.bridge.ReactApplicationContext;
import com.facebook.react.bridge.ReactContextBaseJavaModule;
import com.facebook.react.bridge.ReactMethod;

import org.dpppt.android.sdk.DP3T;

public class RNDP3TSDKModule extends ReactContextBaseJavaModule {

    private final ReactApplicationContext reactContext;

    public RNDP3TSDKModule(ReactApplicationContext reactContext) {
        super(reactContext);
        this.reactContext = reactContext;
    }

    @Override
    public String getName() {
        return "RNDP3TSDK";
    }

    @ReactMethod
    public void initialize(String appId, String environment, Promise promise) {
        try {
            DP3T.init(reactContext, appId, true);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void startTracing(Promise promise) {
        try {
            DP3T.start(reactContext);
            promise.resolve(true);
        } catch (Exception e) {
            promise.reject(e);
        }
    }

    @ReactMethod
    public void sync(Promise promise) {
        try {
            DP3T.sync(reactContext);
        } catch (Exception e) {
            promise.reject(e);
        }
    }
}
