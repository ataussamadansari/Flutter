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
                title: Text("Home"),
                backgroundColor: Colors.green
            ),
            body: Text(
                // 'Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World! Hello World!',
                'Hello World!',
                // maxLines: 2,
                // textAlign: TextAlign.justify,
                // textDirection: TextDirection.ltr,
                style: TextStyle(
                    fontSize: 30,
                    // fontStyle: FontStyle.italic,
                    color: Colors.red,
                    fontFamily: 'Macondo',
                    // overflow: TextOverflow.ellipsis,
                    // decoration: TextDecoration.underline,
                    // decorationColor: Colors.red,
                    // decorationThickness: 4
                    // wordSpacing: 10
                    shadows: [
                        Shadow(
                            color: Colors.redAccent,
                            blurRadius: 5,
                            offset: Offset(2, 2)
                        )
                    ],
                    // backgroundColor: Colors.blueGrey,
                )
            )
        );
    }
}
