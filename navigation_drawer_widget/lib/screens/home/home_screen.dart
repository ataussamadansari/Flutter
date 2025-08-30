import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  GlobalKey<ScaffoldState> globalKey = GlobalKey<ScaffoldState>();
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
          key: globalKey,
            appBar: AppBar(
                title: Text('Navigation Drawer', 
                    style: TextStyle(
                        color: Colors.white
                    )
                ),
                backgroundColor: Colors.indigoAccent,
                leading: IconButton(
                    onPressed: () {
                      globalKey.currentState?.openDrawer();
                    },
                    color: Colors.white,
                    icon: Icon(Icons.menu))
            ),
            drawer: Drawer(
                child: ListView(
                    children: [
                        FlutterLogo(size: 100),
                        const SizedBox(height: 15),
                        Text(
                            'App Title',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 30
                            )
                        ),
                        const SizedBox(height: 50),
                        ListTile(
                            leading: Icon(Icons.home),
                            title: Text('Home'),
                            // trailing: Icon(Icons.arrow_forward_ios_outlined),
                            onTap: ()
                            {
                                print("Home");
                            }
                        ),
                        ListTile(
                            leading: Icon(Icons.settings),
                            title: Text('Settings'),
                            onTap: ()
                            {
                                print("Settings");
                            }
                        ),
                        ListTile(
                            leading: Icon(Icons.info),
                            title: Text('About'),
                            onTap: ()
                            {
                                print("About");
                            }
                        ),
                        ListTile(
                            leading: Icon(Icons.help),
                            title: Text('Help'),
                            onTap: ()
                            {
                                print("Help");
                            }
                        ),
                        ListTile(
                            leading: Icon(Icons.privacy_tip),
                            title: Text('Privacy Policy'),
                            onTap: ()
                            {
                                print("Privacy Policy");
                            }
                        ),
                        ListTile(
                            leading: Icon(Icons.logout),
                            title: Text('Logout'),
                            onTap: ()
                            {
                                print("Logout");
                            }
                        )
                    ]
                )
            )
        );
    }
}
