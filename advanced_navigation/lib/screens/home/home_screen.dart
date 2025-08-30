import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/profile', arguments: 'Samad');
                },
                child: Text("Go To Profile")
            ),

            /*ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/settings');
                },
                child: Text("Go To Settings")
            ),*/

            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/settings', arguments: {
                    'name' : 'Samad',
                    'age' : 21,
                    'email' : 'Samad@gmail.com'
                  });
                },
                child: Text("Go To Settings")
            )
          ],
        ),
      ),
    );
  }
}
