import 'package:flutter/material.dart';

class ItemProduct extends StatelessWidget {
  final String title, description, image, rating, price;
  const ItemProduct({super.key, required this.title, required this.description, required this.image, required this.rating, required this.price});

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
            children: [
              Flexible(
                  child: ClipRRect(
                      borderRadius: BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                      child: Image.asset(
                          'assets/images/$image',
                          width: double.infinity,
                          fit: BoxFit.cover
                      )
                  )
              ),

              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                            title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700
                            )
                        ),
                        Text(
                            description,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis
                        ),

                        Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange),
                              Text(rating, style: TextStyle(fontWeight: FontWeight.w700)),
                              Spacer(),
                              Text("\$ $price", style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700))
                            ]
                        )
                      ]
                  )
              )

            ]
        )
    );
  }
}
