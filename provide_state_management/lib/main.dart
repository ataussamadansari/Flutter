import 'package:flutter/material.dart';
import 'package:provide_state_management/screens/main/main_screen.dart';
import 'package:provide_state_management/screens/main/provider/main_provider.dart';
import 'package:provide_state_management/utils/providers/theme_provider.dart';
import 'package:provider/provider.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return ChangeNotifierProvider(
            create: (context) => ThemeProvider(),
            child: Consumer<ThemeProvider>(
                builder: (context, provider, child) {
                  return MaterialApp(
                      debugShowCheckedModeBanner: false,
                      themeMode: provider.themeMode,
                      darkTheme: ThemeData.dark(),
                      home: ChangeNotifierProvider(
                          create: (context)
                          {
                            return MainProvider();
                          },
                          child: MainScreen()
                      )
                  );
                }
            )
        );
    }
}

