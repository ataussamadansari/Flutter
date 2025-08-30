import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  final String name;
  const ProfileScreen({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome, $name'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: ElevatedButton(
            onPressed: (){
              Navigator.pop(context);
            },
            child: Text('Previous Screen')
        ),
      ),
    );
  }
}
