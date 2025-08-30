import 'package:advanced_navigation/utils/route_helper.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: RouteHelper.myRoute(),
      onGenerateRoute: (RouteSettings settings) {
        return RouteHelper.myOnGenerateRoute(settings);
      },
    );
  }
}

