import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget
{
    const HomeScreen({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text("Image Widget"),
                backgroundColor: Colors.indigo
            ),
            body: CircleAvatar(
              backgroundColor: Colors.grey,
              radius: 100,
              backgroundImage: AssetImage('assets/images/enjoy_summer.jpg'),
            )
        /// short-cut image widget
          /*Image.asset(
                width: double.infinity,
                height: double.infinity,
                'assets/images/enjoy_summer.jpg',
                fit: BoxFit.cover
            )*/

        /// image 
      /*Image(
        height: double.infinity,
        width: double.infinity,
        // fit: BoxFit.cover,
        // repeat: ImageRepeat.repeat,
        // alignment: Alignment.bottomCenter,
        // image: AssetImage('assets/images/star.png'),
        image: NetworkImage("https://plus.unsplash.com/premium_photo-1677180777140-895e6bdda25e?q=80&w=387&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),
      ),*/
        );
    }
}
