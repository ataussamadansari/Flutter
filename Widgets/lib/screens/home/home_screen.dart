import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    String title = "Home";
    int i = 0;

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(title),
                backgroundColor: Colors.blue
            ),

            body: ElevatedButton(
                onPressed: ()
                {
                    setState(()
                        {
                            title = 'New Title ${++i}';
                            print(title);
                        }
                    );
                }, 
                child: Text("Button")
            )
        );
    }
}

