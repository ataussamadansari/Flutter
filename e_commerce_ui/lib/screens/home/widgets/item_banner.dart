import 'package:flutter/material.dart';

class ItemBanner extends StatelessWidget
{
    final String image;
    const ItemBanner({super.key, required this.image});

    @override
    Widget build(BuildContext context) 
    {
        return Container(
            margin: EdgeInsets.all(12),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/$image')
                )
            )
        );
    }
}
