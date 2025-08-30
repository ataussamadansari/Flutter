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
                title: Text("Stack Widget"),
                centerTitle: true
            ),
            body: Stack(
                children: [
                    Positioned(
                        left: -70,
                        bottom: -70,
                        child: Container(
                            height: 200,
                            width: 200,
                            decoration: BoxDecoration(
                                color: Colors.redAccent.withAlpha(144),
                                borderRadius: BorderRadius.only(topRight: Radius.circular(100))
                            )
                        )
                    ),

                    Positioned(
                        top: -20,
                        right: -20,
                        child: Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.green.withAlpha(100)
                            )
                        )
                    )

                ]
            )
        );
    }
}
