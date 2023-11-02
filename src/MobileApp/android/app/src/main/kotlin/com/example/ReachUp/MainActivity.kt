package com.CSoft.ReachUp

import android.content.ClipData
import android.content.ClipDescription.MIMETYPE_TEXT_PLAIN
import android.content.ClipboardManager
import android.content.Context
import android.os.Bundle
import android.util.Log
import io.flutter.embedding.android.FlutterActivity

class MainActivity: FlutterActivity() {

     override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        val clipboard = getSystemService(Context.CLIPBOARD_SERVICE) as ClipboardManager
        val primaryClipDescription = clipboard.primaryClipDescription
        val clip: ClipData = ClipData.newPlainText("Label", "Value")
        if (clipboard.hasPrimaryClip() && (primaryClipDescription == null || !primaryClipDescription.hasMimeType(MIMETYPE_TEXT_PLAIN))) {

            Log.i("MainActivityTag", "Clipboard Updated")
        } else if (!clipboard.hasPrimaryClip()) {
            // Only for Stable Channel. PrimaryClip NPE Handled in Master channel already
            Log.i("MainActivityTag", "Clipboard is Empty...Updated")
        } else {
            Log.i("MainActivityTag", "Clipboard Safe")
        }
    }
}
