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
                title: Text("Responsive UI"),
                backgroundColor: Colors.indigoAccent
            ),
            body: Flex(direction: Axis.vertical,
                children: [
                    Flexible(
                        child: Container(
                            width: double.infinity,
                            color: Colors.red
                        )
                    ),
                    Flexible(
                        child: Container(
                            width: double.infinity,
                            color: Colors.green
                        )
                    )
                ]
            )

          /*Column(
                children: [
                    Expanded(
                      flex: 1,
                        child: Container(
                            color: Colors.red,
                            width: double.infinity,
                            height: 200 // Expanded in not apply to the child
                        )
                    ),
                  *//*  Container(
                        color: Colors.orange,
                        width: double.infinity,
                        height: 200 
                    ),*//*

                    Flexible(
                        flex: 2,
                        child: Container(
                            color: Colors.blue,
                            width: double.infinity,
                            height: 200 // Flexible in apply to the child
                        )
                    ),
                    Container(
                        color: Colors.orange,
                        width: double.infinity,
                        height: 200
                    )
                ]
            )*/

          /*Column(
                children: [
                    Expanded(
                        // flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                                child: Container(
                                    width: double.infinity,
                                    color: Colors.redAccent
                                )
                            ),
                            Expanded(
                                child: Container(
                                    width: double.infinity,
                                    color: Colors.orangeAccent
                                )
                            ),
                            Expanded(
                                child: Container(
                                    width: double.infinity,
                                    color: Colors.purpleAccent
                                )
                            )
                          ],
                        )
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            color: Colors.greenAccent
                        )
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            color: Colors.blueAccent
                        )
                    ),
                    Expanded(
                        child: Container(
                            width: double.infinity,
                            color: Colors.yellowAccent
                        )
                    )
                ]
            )*/
        );
    }
}
