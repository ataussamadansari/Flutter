import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tabs_in_flutter/screens/call/call_screen.dart';
import 'package:tabs_in_flutter/screens/chat/chat_screen.dart';
import 'package:tabs_in_flutter/screens/status/status_screen.dart';

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
        return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                    backgroundColor: Colors.green,
                    title: Text("WhatsApp", style: TextStyle(color: Colors.white)),
                    bottom: TabBar(
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.white,
                        indicatorColor: Colors.white,
                        indicatorAnimation: TabIndicatorAnimation.elastic,
                        tabs: [
                            Tab(text: "CHAT", icon: Icon(CupertinoIcons.chat_bubble_2)),
                            Tab(text: "STATUS", icon: Icon(CupertinoIcons.app_badge),),
                            Tab(text: "CALL", icon: Icon(CupertinoIcons.phone),)
                        ]
                    )
                ),
                body: TabBarView(
                    children: [
                      ChatScreen(),
                      StatusScreen(),
                      CallScreen()
                    ]
                )

                /*body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                TabBar(
                    tabs: [
                      Tab(text: "CHAT"),
                      Tab(text: "STATUS"),
                      Tab(text: "CALL"),
                    ]
                ),
                Expanded(
                  child: TabBarView(
                      children: [
                        ChatScreen(),
                        StatusScreen(),
                        CallScreen()
                      ]
                  ),
                )
              ],
            )
                ),*/
            )
        );
    }
}
