import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/providers/auth_provider.dart';
import 'package:firebase_login/providers/quote_provider.dart';
import 'package:firebase_login/screens/auth/login_screen.dart';
import 'package:firebase_login/screens/auth/register_screen.dart';
import 'package:firebase_login/screens/home/home_screen.dart';
import 'package:firebase_login/screens/quote/add_quote_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'firebase_options.dart';

main() async
{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform,
    );
    runApp(const MyApp());
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MultiProvider(
            providers: [
                ChangeNotifierProvider(create: (_) => AuthProvider()),
                ChangeNotifierProvider(create: (_) => QuoteProvider()),
            ],
            child: MaterialApp(
                debugShowCheckedModeBanner: false,
                title: 'Firebase Auth App',
                theme: ThemeData(
                    primarySwatch: Colors.green
                ),
                home: AuthWrapper(),
                routes: {
                    '/login': (context) => LoginScreen(),
                    '/register': (context) => RegisterScreen(),
                    '/home': (context) => HomeScreen(),
                    '/add-quote': (context) => AddQuoteScreen()
                },
            ),
        );
    }
}

class AuthWrapper extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        final authProvider = Provider.of<AuthProvider>(context);

        if (authProvider.isLoading) {
            return Scaffold(
                body: Center(child: CircularProgressIndicator()),
            );
        }

        return authProvider.user != null ? HomeScreen() : LoginScreen();
    }
}