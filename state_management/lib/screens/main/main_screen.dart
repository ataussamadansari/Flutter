import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    print('build function called');
    return Scaffold(
      appBar: AppBar(
        title: Text('State Management'),
      ),
      body: Center(
        child: Text(
          count.toString(),
          style: TextStyle(
              fontSize: 30
          )
        ),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              count++;
            });
          },
        child: Icon(CupertinoIcons.add),
      ),
    );
  }
}
