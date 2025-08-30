import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                // backgroundColor: Theme.of(context).primaryColor
              leading: IconButton(onPressed: (){}, icon: Icon(Icons.menu)),
              actions: [
                IconButton(onPressed: (){}, icon: Icon(Icons.search)),
                IconButton(onPressed: (){}, icon: Icon(Icons.more_vert)),
              ],
            ),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 15,
                    children: [
                        ElevatedButton(onPressed: () {},
                            child: Text("Button")
                        ),
                        ElevatedButton(onPressed: ()
                            {
                            },
                            child: Text("Button")
                        ),
                        Text("Hello World!", style: Theme.of(context).textTheme.headlineLarge/*?.copyWith(
                                fontSize: 100
                            )*/
                        ),
                      Icon(Icons.home_filled)
                    ]
                )
            )
        );
    }
}
