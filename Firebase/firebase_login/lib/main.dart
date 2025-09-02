import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_login/providers/auth/auth_provider.dart';
import 'package:firebase_login/screens/auth/login_screen.dart';
import 'package:firebase_login/screens/auth/register_screen.dart';
import 'package:firebase_login/screens/home/home_screen.dart';
import 'package:firebase_login/utils/routes/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

main() async
{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();

    runApp(
        ChangeNotifierProvider(
            create: (_) => AuthProvider(),
            child: const MyApp()
        )
    );
}

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) 
    {
        final auth = Provider.of<AuthProvider>(context, listen: false);
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: const Wrapper(),
            routes:
            {
                '/login':(context) => const LoginScreen(),
                '/register':(context) => const RegisterScreen(),
                '/home':(context) => const HomeScreen()
            }
        );
    }
}
