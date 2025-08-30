import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    String title = "Button Widget";
    bool centerTitle = false;

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(title),
                centerTitle: centerTitle,
                backgroundColor: Colors.deepOrangeAccent
            ),
            body: IconButton(
                onPressed: ()
                {
                    setState(() {
                      centerTitle = !centerTitle;
                    });
                },
                color: Colors.deepOrangeAccent,
                icon: Icon(Icons.add))

        /// Text btn with icon
            /*TextButton.icon(
                onPressed: ()
                {
                    print("text btn");
                },
                onLongPress: () {
                    print("long press");
                },
                label: Text("Text Btn"),
                icon: Icon(Icons.person_2_rounded),
            )*/

        /// Elevated Btn with Icon
            /*ElevatedButton.icon(
                onPressed: () {
                    print("Clicked");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 10,
                    // iconColor: Colors.green,
                    iconAlignment: IconAlignment.end,
                    // fixedSize: Size(300, 48),
                    // maximumSize: Size(300, 48)
                ),
                label: Text("Elevated Btn with Icon"),
                icon: Icon(Icons.share),
            )*/

        /// Elevated btn
            /*ElevatedButton(
                onPressed: () {
                    print("Clicked");
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurpleAccent,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    elevation: 10,
                    // fixedSize: Size(300, 48),
                    // maximumSize: Size(300, 48)
                ),
                child: Text("Elevated Btn")
            )*/
        );
    }
}

