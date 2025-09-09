import 'package:flutter/material.dart';
import 'package:shared_pref/screens/home/home_screen.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.dark(),
      home: HomeScreen(),
    );
  }
}
