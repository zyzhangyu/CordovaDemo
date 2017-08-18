package com.fay.quq;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;

public class MainActivity extends Activity {

    //region Views Life Cycle

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);
    }

    //endregion


    //region Events Management

    public void openNative(View v) {
        Intent intent = new Intent(MainActivity.this, NativeActivity.class);
        startActivity(intent);
    }

    public void openWeb(View v) {
        Intent intent = new Intent(MainActivity.this, WebActivity.class);
        startActivity(intent);
    }

    //endregion
}
