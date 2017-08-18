package com.fay.quq;

import android.app.Activity;
import android.os.Bundle;
import android.view.View;

/**
 * Created by fay on 2017/8/4.
 */

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
