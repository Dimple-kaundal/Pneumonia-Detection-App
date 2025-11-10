package com.example.flutter_application_1

import android.content.Context
import android.media.AudioManager
import io.flutter.embedding.android.FlutterActivity

class MainActivity : FlutterActivity() {
    override fun onResume() {
        super.onResume()
        // Force Android to use the wired mic if connected
        val audioManager = getSystemService(Context.AUDIO_SERVICE) as AudioManager
        audioManager.mode = AudioManager.MODE_IN_COMMUNICATION
        audioManager.isSpeakerphoneOn = false
        try {
            val method = audioManager.javaClass.getMethod("setWiredHeadsetOn", Boolean::class.javaPrimitiveType)
            method.invoke(audioManager, true)
        } catch (e: Exception) {
            e.printStackTrace()
        }
    }
}
