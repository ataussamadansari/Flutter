import 'package:cubit/cubit/auth/auth_cubit.dart';
import 'package:cubit/screens/home/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget
{
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: BlocProvider(create: (context) => AuthCubit(), child: HomeScreen())
        );
    }
}
