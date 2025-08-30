import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
    bool isConnected = false;
    String? groupValue = 'one';
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Some Widgets"),
                backgroundColor: Colors.indigo
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                spacing: 12,
                children: [
                  CircularProgressIndicator(
                    color: Colors.indigoAccent,
                  ),
                  LinearProgressIndicator(
                    color: Colors.indigoAccent,
                  )
                ],
              ),
            )

            /*Column(
              children: [
                Wrap(
                  spacing: 10,
                  runSpacing: 10,
                  children: [
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.red,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.blue,
                      height: 50,
                      width: 50,
                    ),
                    Container(
                      color: Colors.green,
                      height: 50,
                      width: 50,
                    ),
                  ],
                )
              ],
            )*/

            /*Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                        Switch(
                            value: isConnected,
                            onChanged: (value)
                            {
                                setState(()
                                    {
                                        isConnected = value;
                                    }
                                );
                            },
                            activeColor: Colors.indigo,
                            activeTrackColor: Colors.indigoAccent.withAlpha(100),
                            inactiveThumbColor: Colors.black,
                            inactiveTrackColor: Colors.black.withAlpha(50)
                        ),

                        SwitchListTile(
                            value: isConnected,
                            onChanged: (value)
                            {
                                setState(()
                                    {
                                        isConnected = value;
                                    }
                                );
                            },
                            title: Text("Internet Connectivity"),
                            subtitle: Text("Check your internet connection"),
                            activeColor: Colors.indigo,
                            activeTrackColor: Colors.indigoAccent.withAlpha(100)
                        ),

                        Checkbox(
                            value: isConnected,
                            checkColor: Colors.white,
                            activeColor: Colors.indigoAccent,
                            onChanged: (value)
                            {
                                setState(()
                                    {
                                        isConnected = value!;
                                    }
                                );
                            }
                        ),

                        CheckboxListTile(
                            value: isConnected, 
                            onChanged: (value)
                            {
                                setState(()
                                    {
                                        isConnected = value!;
                                    }
                                );
                            },
                            title: Text("Title"),
                            subtitle: Text("Subtitle")
                        ),

                      RadioMenuButton(
                          value: 'one',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          child: Text("One")
                      ),
                      RadioMenuButton(
                          value: 'two',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          child: Text("Two")
                      ),
                      RadioMenuButton(
                          value: 'three',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                          child: Text("Three")
                      ),

                      RadioListTile(
                          value: 'four',
                          groupValue: groupValue,
                          onChanged: (value) {
                            setState(() {
                              groupValue = value;
                            });
                          },
                        title: Text("Title"),
                        subtitle: Text("Subtitle")
                      ),
                    ]
                )
            )*/
        );
    }
}
