import 'dart:convert';


import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_modular/flutter_modular.dart';



class CustumNotification {
  int id;
  String? title;
  String? description;
  Map? payload;

  CustumNotification(
      {required this.id,
        required this.title,
        required this.description,
        required this.payload});
}

class NotificationService {
  late FlutterLocalNotificationsPlugin localNotificationsPlugin;
  late AndroidNotificationDetails androidNotificationDetails;

  NotificationService() {
    localNotificationsPlugin = FlutterLocalNotificationsPlugin();
    _initializeNotification();
  }

  clearNotification() async {
    await localNotificationsPlugin.cancelAll();
  }

  _initializeNotification() {
    const android = AndroidInitializationSettings("@mipmap/ic_launcher");

    localNotificationsPlugin.initialize(
        const InitializationSettings(android: android));
  }

  showNotification(CustumNotification custumNotification) {
    androidNotificationDetails = const AndroidNotificationDetails(
        'paciente_notification', 'medico_notificatin',
        importance: Importance.max,
        priority: Priority.max,
        enableVibration: true,
        fullScreenIntent: true);

    localNotificationsPlugin.show(
        custumNotification.id,
        custumNotification.title,
        custumNotification.description,
        NotificationDetails(android: androidNotificationDetails),
        payload: custumNotification.payload.toString());
  }
}