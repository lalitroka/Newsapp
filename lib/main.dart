import 'package:flutter/material.dart';
import 'package:practise/home/home_page.dart';
import 'package:practise/auth/login/login_page.dart';
import 'package:practise/profile/profile_detials_page.dart';
import 'package:practise/profile/profile_photopage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginPage(),
        '/home': (context) => const Homepage(),
        '/profile': (context) => const ProfileDetail(),
        '/photopage':(context) => const Photopage(),
      },
    );
  }
}
