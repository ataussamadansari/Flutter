import 'package:flutter/material.dart';
import 'package:navigation_drawer_with_bottom_nav_bar/screens/home/home_screen.dart';

import '../profile/profile_screen.dart';
import '../settings/settings_screen.dart';

class MainScreen extends StatefulWidget
{
    const MainScreen({super.key});

    @override
    State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
{

    List<Widget> navScreens = [
        HomeScreen(),
        SettingsScreen(),
        ProfileScreen()
    ];
    List<String> titles = [
        'Home',
        'Settings',
        'Profile'
    ];
    int currentIndex = 0;

    GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
          key: globalKey,
            appBar: AppBar(
                title: Text(titles[currentIndex])
            ),
            drawer: Drawer(
                child: ListView(
                    children: [
                        FlutterLogo(size: 100),
                        SizedBox(height: 20),
                        ListTile(
                            selected: currentIndex == 0,
                            leading: Icon(Icons.home),
                            title: Text('Home'),
                            onTap: ()
                            {
                                globalKey.currentState?.closeDrawer();
                                setState(()
                                    {
                                        currentIndex = 0;
                                    }
                                );
                            }
                        ),
                        Divider(),
                        ListTile(
                            selected: currentIndex == 1,
                            leading: Icon(Icons.settings),
                            title: Text('Settings'),
                            onTap: ()
                            {
                                globalKey.currentState?.closeDrawer();
                                setState(()
                                    {
                                        currentIndex = 1;
                                    }
                                );
                            }
                        ),
                        Divider(),
                        ListTile(
                            selected: currentIndex == 2,
                            leading: Icon(Icons.person),
                            title: Text('Profile'),
                            onTap: ()
                            {
                                setState(()
                                    {
                                        currentIndex = 2;
                                    }
                                );
                                globalKey.currentState?.closeDrawer();
                            }
                        ),
                        Divider(),
                        ListTile(
                            leading: Icon(Icons.exit_to_app),
                            title: Text('LogOut'),
                            onTap: ()
                            {
                                globalKey.currentState?.closeDrawer();
                            }
                        )

                    ]
                )
            ),
            bottomNavigationBar: BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                currentIndex: currentIndex,
                onTap: (value)
                {
                    setState(()
                        {
                            currentIndex = value;
                        }
                    );
                },
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: 'Settings'
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.person),
                        label: 'Profile'
                    )
                ]
            ),
            body: navScreens[currentIndex]
        );
    }
}
