import 'package:flutter/material.dart';
import 'package:navigation/screens/profile/profile_screen.dart';
import 'package:navigation/screens/settings/settings_screen.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Home'),
                backgroundColor: Colors.indigo
            ),
            body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                        ElevatedButton(
                            onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context)
                                        {
                                            return ProfileScreen(name: 'Samad',);
                                        }
                                    )
                                );
                            },
                            child: Text('Profile Screen')
                        ),
                        ElevatedButton(
                            onPressed: () {
                                Navigator.pushReplacement(context, MaterialPageRoute(
                                    builder: (context) {
                                      return SettingsScreen();
                                    })
                                );
                            },
                            child: Text('Settings Screen'))
                    ]
                )
            )
        );
    }
}
