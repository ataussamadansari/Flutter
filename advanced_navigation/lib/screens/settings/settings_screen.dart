import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  final String name, email;
  final int age;

  const SettingsScreen({super.key, required this.name, required this.email, required this.age});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        backgroundColor: Colors.indigo,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Name: ${widget.name}'),
            Text('Email: ${widget.email}'),
            Text('Age: ${widget.age}'),
          ],
        ),
      ),
    );
  }
}
