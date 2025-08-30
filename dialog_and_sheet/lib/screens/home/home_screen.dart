import 'package:flutter/cupertino.dart';
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
                title: Text('Dialog and Sheet')
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                        ElevatedButton(
                            onPressed: ()
                            {
                                showDialog(
                                    context: context,
                                    builder: (context)
                                    {
                                        return AlertDialog(
                                            icon: Icon(Icons.logout),
                                            title: Text('This is title'),
                                            content: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                    Text('This is content'),
                                                    Text('This is content'),
                                                    Text('This is content'),
                                                    Text('This is content')
                                                ]
                                            ),
                                            actions: [
                                                TextButton(onPressed: ()
                                                    {
                                                        Navigator.pop(context);
                                                    }, child: Text('Yes')),
                                                TextButton(onPressed: ()
                                                    {
                                                        Navigator.pop(context);
                                                    }, child: Text('No'))
                                            ],
                                            // actionsAlignment: MainAxisAlignment.center,
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
                                        );
                                    }
                                );
                            },
                            child: Text("Show Dialog")),

                        OutlinedButton(
                            onPressed: () {
                                showModalBottomSheet(
                                    context: context,
                                    showDragHandle: true,
                                    barrierLabel: 'This is barrier label',
                                    builder: (context)
                                    {
                                        return SizedBox(
                                            height: 150,
                                            width: double.infinity,
                                            child: Column(
                                              spacing: 12,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                    Text(
                                                        'Are you sure you want to logout?',
                                                        style: TextStyle(
                                                            fontSize: 16,
                                                            fontWeight: FontWeight.w400
                                                        )
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.all(12.0),
                                                      child: Row(
                                                          spacing: 12,
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          children: [
                                                              Expanded(
                                                                  flex: 1,
                                                                  child: OutlinedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      child: Text('No')
                                                                  )
                                                              ),
                                                              Expanded(
                                                                  flex: 1,
                                                                  child: ElevatedButton(
                                                                      onPressed: () {
                                                                        Navigator.pop(context);
                                                                      },
                                                                      style: ElevatedButton.styleFrom(
                                                                          backgroundColor: Colors.red,
                                                                          foregroundColor: Colors.white
                                                                      ),
                                                                      child: Text('Yes')
                                                                  )
                                                              )
                                                          ]
                                                      ),
                                                    )
                                                ]
                                            )
                                        );
                                    }
                                );
                            },
                            child: Text("Show Bottom Sheet")
                        )
                    ]
                )
            )
        // bottomSheet: ElevatedButton(onPressed: (){}, child: Text('This is bottom sheet')),
        );
    }
}
