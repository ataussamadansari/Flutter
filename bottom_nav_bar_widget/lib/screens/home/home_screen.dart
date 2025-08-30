import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    int index = 0;
    List item = ['Home', 'Search', 'Settings'];
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text(item[index], style: TextStyle( color: Colors.white),),
                backgroundColor: Colors.indigoAccent
            ),
            body: Center(
                child: Text("${item[index]}",
                    style: TextStyle(
                        fontSize: 30
                    )
                )
            ),
            bottomNavigationBar: BottomNavigationBar(
                onTap: (value)
                {
                    setState(()
                        {
                            index = value;
                        }
                    );
                },
                showUnselectedLabels: false,
                selectedItemColor: Colors.indigoAccent,
                currentIndex: index,
                items: [
                    BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: "Home",
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.search),
                        label: "Search"
                    ),
                    BottomNavigationBarItem(
                        icon: Icon(Icons.settings),
                        label: "Settings"
                    )
                ]
            )
        );
    }
}
