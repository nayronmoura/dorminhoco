import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final FlutterLocalNotificationsPlugin fnp =
      FlutterLocalNotificationsPlugin();
  static final NotificationService _notificationService =
      NotificationService._internal();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  static Future<void> init() async {
    //Initialization Settings for Android
    final AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icone');

    //Initialization Settings for iOS
    final IOSInitializationSettings initializationSettingsIOS =
        IOSInitializationSettings(
      requestSoundPermission: false,
      requestBadgePermission: false,
      requestAlertPermission: false,
    );

    //InitializationSettings for initializing settings for both platforms (Android & iOS)
    final InitializationSettings initializationSettings =
        InitializationSettings(
            android: initializationSettingsAndroid,
            iOS: initializationSettingsIOS);

    await fnp.initialize(initializationSettings);
  }

  final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: AndroidNotificationDetails(
          'channel ID', 'channel name', 'channel description',
          playSound: true,
          priority: Priority.high,
          importance: Importance.high,
          icon: 'app_icone.png'));

  Future<void> showNotifications(int id, String title, String body) async {
    await fnp.show(
      id,
      title,
      body,
      platformChannelSpecifics,
      payload: 'Notification Payload',
    );
  }
}
