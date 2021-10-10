package com.example.dorminhoco
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import android.bluetooth.BluetoothAdapter;
class MainActivity:FlutterActivity() {
    private val CHANNEL = "com.example.dorminhoco/bluetooth"
    
    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL).setMethodCallHandler {
          call, result ->
            if(call.method.equals("blutetoothdisable")){
                val mBluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
                if(mBluetoothAdapter.isEnabled){
                result.success(mBluetoothAdapter.disable());}

            }
        }
      }
}
