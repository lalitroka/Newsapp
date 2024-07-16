import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:firebase_messaging/firebase_messaging.dart';


class LocalNotification {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

    //initialize method
   
  static initialize(RemoteMessage message) async {
    InitializationSettings init = const InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

      //notification detial for handling


    NotificationDetails notificationDetails = const NotificationDetails(
      android: AndroidNotificationDetails(
        "Channel Id",
        "Main Channel",
        color: Colors.green,
        importance: Importance.max,
        playSound: true,
        priority: Priority.high,
      ),
    );

    // initializing plugin 
    await _notificationsPlugin.initialize(
      init,
      onDidReceiveNotificationResponse: (details) {
        if (details.input != null) {}
      },
    );

  // displaying the notification format

    await _notificationsPlugin.show(
      0,
      message.notification?.title,
      message.notification?.body,
      notificationDetails,
    );
  }
}
