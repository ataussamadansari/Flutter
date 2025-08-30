import 'package:flutter/material.dart';

class ItemCategory extends StatelessWidget {
    final String image, title;
    final Color color;
    const ItemCategory({super.key, required this.image, required this.title, required this.color});

    @override
    Widget build(BuildContext context) 
    {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
              spacing: 2,
              children: [
                  Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: color,
                          shape: BoxShape.circle
                      ),
                      child: Image.asset(
                          'assets/icons/$image',
                          color: Colors.white,
                          height: 45)
                  ),
                  Text(
                      title,
                      style: TextStyle(
                          fontWeight: FontWeight.w500
                      )
                  )
              ]
          ),
        );
    }
}
