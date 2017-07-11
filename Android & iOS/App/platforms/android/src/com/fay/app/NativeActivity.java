package com.fay.app;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

public class NativeActivity extends Activity {

    //region Views Life Cycle
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_native);
    }
    //endregion

    //region Events Management
    public void closeMe(View v) {
        finish();
    }
    //endregion
}
