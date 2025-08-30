import 'package:flutter/material.dart';
import 'package:widgets/screens/home/home_screen.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Title',
      debugShowCheckedModeBanner: false,
      home: HomeScreen()
    );
  }
}

