import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practise/home/page/home_page.dart';
import 'package:practise/auth/login/login_page.dart';
import 'package:practise/home/page/notification_page.dart';
import 'package:practise/profile/profile_detials_page.dart';
import 'package:practise/profile/profile_photopage.dart';
import 'package:practise/service/firebase/firebase_option.dart';
import 'package:practise/service/provider/news_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOption.currentPlatform);
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => NewsProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => StreamBuilder(
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return const LoginPage();
              }
              return const Homepage();
            },
            stream: FirebaseAuth.instance.authStateChanges(),
            ),
            
        '/home': (context) => const Homepage(),
        '/profile': (context) => const ProfileDetail(),
        '/photopage': (context) => const Photopage(),
        '/notificationpage': (context) => const NotificationPage(),
      },
    );
  }
}
