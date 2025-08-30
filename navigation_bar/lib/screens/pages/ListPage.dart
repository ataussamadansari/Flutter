import 'package:flutter/material.dart';

import '../../model/destination.dart';


class ListPage extends StatelessWidget {
  const ListPage({super.key, required this.destination});

  final Destination destination;

  @override
  Widget build(BuildContext context) {
    const int itemCount = 50;
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final ButtonStyle buttonStyle = OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: colorScheme.onSurface.withOpacity(0.12)),
      ),
      foregroundColor: destination.color,
      fixedSize: const Size.fromHeight(64),
      textStyle: Theme.of(context).textTheme.headlineSmall,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text('${destination.title} ListPage - /list'),
        backgroundColor: destination.color,
        foregroundColor: Colors.white,
      ),
      backgroundColor: destination.color[50],
      body: SizedBox.expand(
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: OutlinedButton(
                style: buttonStyle.copyWith(
                  backgroundColor: WidgetStatePropertyAll<Color>(
                    Color.lerp(destination.color[100], Colors.white, index / itemCount)!,
                  ),
                ),
                onPressed: () {
                  Navigator.pushNamed(context, '/text');
                },
                child: Text('Push /text [$index]'),
              ),
            );
          },
        ),
      ),
    );
  }
}
