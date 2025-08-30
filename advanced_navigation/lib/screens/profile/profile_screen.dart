import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  final String name;
  const ProfileScreen({super.key, required this.name});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome ${widget.name}'),
        backgroundColor: Colors.deepOrange,
      ),
    );
  }
}
