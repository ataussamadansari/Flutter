import 'package:flutter/material.dart';

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
                backgroundColor: Colors.green,
                title: Text("Clickable Widget")
            ),
            body: Column(
                children: [
                  /// GestureDetector : no-effect on press/click
                    GestureDetector(
                        onTap: ()
                        {
                            print("Clicked__________");
                        },
                        onLongPress: ()
                        {
                            print("Long Pressed____________");
                        },
                        child: Text("Gesture Detector Widget",
                            style: TextStyle(
                                fontSize: 20
                            )
                        )
                    ),

                    /// InkWell : effect on press/click
                    InkWell(
                        onTap: ()
                        {
                            print("Clicked__________");
                        },
                        onLongPress: ()
                        {
                            print("Long Pressed____________");
                        },
                        child: Text("InkWell Widget", style: TextStyle(
                                fontSize: 30
                            )
                        )
                    )
                ]
            )
        );
    }
}
