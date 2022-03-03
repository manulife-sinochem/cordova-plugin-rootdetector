package org.apache.cordova.rootdetector;

import android.util.Log;

import org.apache.cordova.CordovaPlugin;
import org.apache.cordova.CallbackContext;

import org.json.JSONArray;
import org.json.JSONException;

import java.io.File;

/**
 * This class echoes a string called from JavaScript.
 */
public class rootPlugin extends CordovaPlugin {

       @Override
       public boolean execute(String action, JSONArray args, CallbackContext callbackContext) throws JSONException {
           Log.e("peace","execute >>>>>>>>>>>>>");
           if (action.equals("detectRoot")) {
   //            String message = args.getString(0);
               this.detectRoot( callbackContext);
               return true;
           }
           return false;
       }

       private void detectRoot(CallbackContext callbackContext) {
           callbackContext.success(isDeviceRooted()+"");
       }


    private boolean isDeviceRooted() {
        return checkBuildTags() || checkSuperUserApk() || checkFilePath();
    }
    private boolean checkBuildTags() {
        String buildTags = android.os.Build.TAGS;
        return buildTags != null && buildTags.contains("test-keys");
    }

    private boolean checkSuperUserApk() {
        return new File("/system/app/Superuser.apk").exists();
    }

    private boolean checkFilePath() {
        String[] paths = { "/sbin/su", "/system/bin/su", "/system/xbin/su", "/data/local/xbin/su", "/data/local/bin/su", "/system/sd/xbin/su",
                "/system/bin/failsafe/su", "/data/local/su" };
        for (String path : paths) {
            if (new File(path).exists()) return true;
        }
        return false;
    }
}
