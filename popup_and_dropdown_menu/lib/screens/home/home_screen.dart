import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    int selected = 0;
    List days = [
        'Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday'
    ];

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: const Text('Home'),
                actions: [
                    PopupMenuButton(
                        onSelected: (value) {
                            print("Selected value: $value");
                        },
                        itemBuilder: (context) {
                            return [
                                for (int i = 1; i <= 5; i++)
                                    PopupMenuItem(
                                        value: i,
                                        child: Text('Item $i')
                                    )
                            ];
                            /*return [
                                PopupMenuItem(
                                    *//*onTap: () {
                                        print('Item1');
                                    },*//*
                                    value: 'item1',
                                    child: Text('Item1')
                                ),
                                PopupMenuItem(
                                    value: 'item2',
                                    child: Text('Item2')
                                ),
                                PopupMenuItem(
                                    value: 'item3',
                                    child: Text('Item3')
                                ),
                                PopupMenuItem(
                                    value: 'item4',
                                    child: Text('Item4')
                                ),
                            ];*/
                        }
                    )
                ],
            ),
            body: Center(
                child: DropdownButton(
                    value: selected,
                    items: [
                        for (int i = 0; i < days.length; i++)
                            DropdownMenuItem(
                                value: i,
                                child: Text(days[i])
                            )
                    ],
                    onChanged: (value) {
                        setState(() {
                          selected = value!;
                        });
                    }
                ),
            ),
        );
    }
}
