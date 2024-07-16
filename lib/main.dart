import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practise/home/page/home_page.dart';
import 'package:practise/auth/login/login_page.dart';
import 'package:practise/home/page/notification_page.dart';
import 'package:practise/profile/profile_detials_page.dart';
import 'package:practise/profile/profile_photopage.dart';
import 'package:practise/service/firebase/firebase_option.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOption.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => const LoginPage(),
          '/home': (context) => const Homepage(),
          '/profile': (context) => const ProfileDetail(),
          '/photopage': (context) => const Photopage(),
          '/notificationpage':(context) => const NotificationPage(),
        },
    );
  }
}
