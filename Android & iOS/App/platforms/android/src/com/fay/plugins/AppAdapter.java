package com.fay.plugins;

import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

/**
 * Created by fay on 2017/6/21.
 */

public class AppAdapter extends CordovaPlugin {

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("adapter_dismiss_web")) {
            Log.i("APP_LOG", args.getString(0));
            cordova.getActivity().finish();
            dismissWeb();
        }
        return super.execute(action, args, callbackContext);
    }
    
    void dismissWeb() {
        cordova.getActivity().runOnUiThread(() -> {
            webView.loadUrl("javascript:app.adapter_dismiss()");
        });
    }
}
