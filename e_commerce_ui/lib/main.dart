import 'package:e_commerce_ui/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          shadowColor: Colors.black,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
        )
      ),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          shadowColor: Colors.white,
          backgroundColor: Colors.white
        ),
        scaffoldBackgroundColor: Colors.grey.shade100,
        cardTheme: CardThemeData(
          color: Colors.white
        ),
        textSelectionTheme: TextSelectionThemeData(
          cursorColor: Colors.green,
          selectionColor: Colors.green.shade100,
          selectionHandleColor: Colors.green
        )
      ),
      home: HomeScreen(),
    );
  }
}
