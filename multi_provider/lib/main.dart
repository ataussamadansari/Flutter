import 'package:flutter/material.dart';
import 'package:multi_provider/providers/counter1/counter1_provider.dart';
import 'package:multi_provider/providers/counter2/counter2_provider.dart';
import 'package:multi_provider/providers/counter3/counter3_provider.dart';
import 'package:multi_provider/screens/home/home_screen.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => Counter1Provider()),
          ChangeNotifierProvider(create: (context) => Counter2Provider()),
          ChangeNotifierProvider(create: (context) => Counter3Provider()),
        ],
        child: HomeScreen(),
      )
    );
  }
}
