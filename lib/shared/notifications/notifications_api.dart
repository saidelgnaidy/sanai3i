import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/route_manager.dart';
import 'package:sanai3i/main.dart';

class NotificationCtrl {
  static const String _icon = '@mipmap/ic_launcher'; // '@mipmap/ic_notification';

  static final _notification = FlutterLocalNotificationsPlugin();

  static const InitializationSettings _initializationSettings = InitializationSettings(
    android: AndroidInitializationSettings(_icon),
    iOS: IOSInitializationSettings(),
  );

  static const NotificationDetails _notificationDetails = NotificationDetails(
    android: AndroidNotificationDetails(
      'sanai3i',
      'sanai3i',
      channelDescription: 'sanai3i',
      importance: Importance.max,
      playSound: true,
      enableVibration: true,
      onlyAlertOnce: true,
      icon: _icon,
    ),
    iOS: IOSNotificationDetails(presentSound: true),
  );

  static initNotification() async {
    await _notification.initialize(_initializationSettings, onSelectNotification: _selectNotification);
  }

  static Future _selectNotification(payload) async {
    Get.offAll(() => const Landing());
  }

  static Future sendNotification({String? title, String? body}) async {
    _notification.show(1, title, body, _notificationDetails);
  }

  static firebaseMSG() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;

    await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    messaging.getToken().then((value) => debugPrint('MSG Token: $value'));

    FirebaseMessaging.onMessage.listen(
      (RemoteMessage message) {
        messaging.setForegroundNotificationPresentationOptions();
        if (message.notification != null) {
          sendNotification(title: message.notification?.title, body: message.notification?.body);
        }
      },
    );
  }
}
