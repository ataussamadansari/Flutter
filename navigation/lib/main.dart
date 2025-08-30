import 'package:flutter/material.dart';
import 'package:navigation/screens/home/home_screen.dart';
import 'package:navigation/screens/splash/splash_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}
