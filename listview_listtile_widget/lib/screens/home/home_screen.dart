import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{

    List<int> numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("ListView and ListTile Widget"),
                backgroundColor: Colors.green
            ),
            body: ListView(
              children: [
                for (int i = 0; i < 50; i++)
                ListTile(
                  title: Text("This is title"),
                  subtitle: Text("This is subtitle"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage("https://picsum.photos/200/${i + 10}"),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios),
                )
              ],
            )
          
          
          /*ListView(
                padding: EdgeInsets.all(20),
                children: numbers.map((item)
                    {
                        return Container(
                            height: 100,
                            color: Colors.indigo,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.center,
                            child: Text("Item $item", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ))
                        );
                    }
                ).toList()
            )*/

          /*ListView(
                padding: EdgeInsets.all(20),
                children: [
                    for (int num in numbers)
                        Container(
                            height: 100,
                            color: Colors.blue,
                            margin: EdgeInsets.symmetric(vertical: 5),
                            alignment: Alignment.center,
                            child: Text("Item $num", style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white
                                ))
                        )
                ]
            )*/

        /// ListView
      /*SizedBox(
        height: 100,
        child: ListView(
          padding: EdgeInsets.all(20),
          scrollDirection: Axis.horizontal,
          children: [
            Container(
              width: 50,
              color: Colors.blue,
            ),
            Container(
              width: 50,
              color: Colors.green,
            ),
            Container(
              width: 50,
              color: Colors.yellow,
            ),
            Container(
              width: 50,
              color: Colors.orange,
            ),
            Container(
              width: 50,
              color: Colors.pink,
            ),
            Container(
              width: 50,
              color: Colors.purple,
            ),
            Container(
              width: 50,
              color: Colors.grey,
            ),
            Container(
              width: 50,
              color: Colors.red,
            ),
            Container(
              width: 50,
              color: Colors.blue,
            ),
            Container(
              width: 50,
              color: Colors.green,
            ),
          ],
        ),
      ),*/
        );
    }
}

