import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/auth/auth_provider.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

    void _logout(AuthProvider auth) async
    {
        await auth.logout();
    }

    @override
    Widget build(BuildContext context) 
    {
        return Consumer<AuthProvider>(
            builder: (context, auth, child) => Scaffold(
                appBar: AppBar(
                    title: Text('Home'),
                    centerTitle: true,
                    actions: [
                        IconButton(onPressed: ()
                            {
                                _logout(auth);
                            }, icon: Icon(Icons.logout))
                    ]
                ),
                body: Center(
                    child: Text('Home Screen')
                )
            )
        );
    }
}
