import 'package:app_theme/screens/home/home_screen.dart';
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
              backgroundColor: Colors.redAccent,
              iconTheme: IconThemeData(
                  color: Colors.white
              ),
              actionsIconTheme: IconThemeData(
                  color: Colors.white
              )
          )
      ),
      theme: ThemeData(
        primaryColor: Colors.blue,
        // scaffoldBackgroundColor: Colors.black
       /* elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blue,
            foregroundColor: Colors.white
          )
        ),*/
        /*textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontSize: 40
          )
        )*/
        /*iconTheme: IconThemeData(
          color: Colors.greenAccent,
          size: 50
        )*/
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.red,
          iconTheme: IconThemeData(
            color: Colors.white
          ),
          actionsIconTheme: IconThemeData(
            color: Colors.white
          )
        )
      ),
      home: HomeScreen(),
    );
  }
}
