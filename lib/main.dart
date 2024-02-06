import 'package:flutter/material.dart';
import 'package:vishnu/firebase_options.dart';
import 'package:vishnu/pages/splash_page.dart';
import 'package:vishnu/themes/light_mode.dart';
import 'package:firebase_core/firebase_core.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const OnBoardingPage(),
      theme: lightMode,
    );
  }
}
