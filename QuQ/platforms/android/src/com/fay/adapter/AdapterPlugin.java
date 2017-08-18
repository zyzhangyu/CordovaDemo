package com.fay.adapter;

import android.util.Log;

import org.apache.cordova.CallbackContext;
import org.apache.cordova.CordovaPlugin;
import org.json.JSONArray;
import org.json.JSONException;

/**
 * Created by fay on 2017/7/12.
 */

public class AdapterPlugin extends CordovaPlugin {

    //region Cordova Plugin Methods (JavaScript -> Java)

    @Override
    public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
        if (action.equals("adapter_dismiss_web")) {
            Log.i("QuQ", args.getString(0));
            cordova.getActivity().finish();
            adapterDismiss();
        }
        return super.execute(action, args, callbackContext);
    }

    //endregion


    //region Cordova Plugin Methods (Java -> JavaScript)

    private void adapterDismiss() {
        cordova.getActivity().runOnUiThread(() -> {
            webView.loadUrl("javascript:adapter_dismiss()");
        });
    }

    //endregion
}
