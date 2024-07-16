import 'package:firebase_messaging/firebase_messaging.dart';
import 'dart:developer';

import 'package:practise/service/firebase/local_notification.dart';

class PushNotification {
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging.instance;

  Future<String> getFcmToken() async {
    // Request notification permissions
    await _firebaseMessaging.requestPermission();

    // Get the FCM token
    final fcmToken = await _firebaseMessaging.getToken();
    log('FCM Token: $fcmToken');
    return fcmToken ?? "N/A";
  }

  Future initialize() async {
    // Handle foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');

      if (message.notification != null) {
        log('Message also contained a notification: ${message.notification}');
        LocalNotification.initialize(message);
      }
    });
  }
}
