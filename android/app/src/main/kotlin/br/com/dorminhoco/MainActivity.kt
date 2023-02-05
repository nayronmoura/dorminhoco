package br.com.dorminhoco

import android.Manifest
import android.bluetooth.BluetoothAdapter
import android.bluetooth.BluetoothManager
import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.PackageManager
import android.os.BatteryManager
import android.os.Build
import androidx.annotation.RequiresApi
import androidx.core.app.ActivityCompat
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import kotlinx.coroutines.yield
import java.util.stream.Stream

class MainActivity : FlutterActivity(), MethodChannel.MethodCallHandler {
    private lateinit var methodChannel: MethodChannel

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        methodChannel =
            MethodChannel(flutterEngine.dartExecutor.binaryMessenger, "br.com.dorminhoco")
        methodChannel.setMethodCallHandler(this);
    }

    @RequiresApi(Build.VERSION_CODES.M)
    override fun onMethodCall(call: MethodCall, result: MethodChannel.Result) {
        if (call.method.equals("bluetoothdisable")) {
            val value = disableBluetooth()
            if (value == null) result.error(
                "Bluettoh",
                "Sem Suporte",
                "Dispositivo não suporta Bluetooth"
            );
            if (value!!) {
                result.success("Bateria desativada");
            } else {
                result.error("001", "Erro ao desabilitar o bluetooth", null)
            }
        } else if (call.method.equals("getBatteryLevel")) {
            val batteryLevel: Int = getBatteryLevel();

            result.success(batteryLevel);


        } else {
            result.notImplemented();
        }
    }

    @RequiresApi(Build.VERSION_CODES.M)
    private fun disableBluetooth(): Boolean? {
        val bluetoothManager: BluetoothManager =
            context.getSystemService(Context.BLUETOOTH_SERVICE) as BluetoothManager
        val bluetoothAdapter: BluetoothAdapter = bluetoothManager.adapter ?: return null

        if (ActivityCompat.checkSelfPermission(
                this,
                Manifest.permission.BLUETOOTH_ADMIN
            ) != PackageManager.PERMISSION_GRANTED
        ) {
            ActivityCompat.requestPermissions(
                this,
                arrayOf(Manifest.permission.BLUETOOTH_ADMIN),
                1
            )
        }
        return bluetoothAdapter.disable();

    }

    private fun getBatteryLevel(): Int {
        val batteryLevel: Int = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            val batteryManager = context.getSystemService(Context.BATTERY_SERVICE) as BatteryManager
            batteryManager.getIntProperty(BatteryManager.BATTERY_PROPERTY_CAPACITY)
        } else {
            val intent = ContextWrapper(applicationContext).registerReceiver(
                null, IntentFilter(
                    Intent.ACTION_BATTERY_CHANGED
                )
            )
            (intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100) / intent.getIntExtra(
                BatteryManager.EXTRA_SCALE,
                -1
            )
        }
        return batteryLevel
    }

}


