import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Column and Row Widget"),
        backgroundColor: Colors.cyanAccent,
      ),
      body: Column(
        spacing: 8,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            spacing: 8,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: 200,
                height: 200,
                color: Colors.red,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.green,
              ),
              Container(
                width: 200,
                height: 200,
                color: Colors.blue,
              ),
            ],
          ),

          Container(
            width: 200,
            height: 200,
            color: Colors.amber,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.redAccent,
          ),
          Container(
            width: 200,
            height: 200,
            color: Colors.blue,
          ),

        ],
      ),
    );
  }
}
