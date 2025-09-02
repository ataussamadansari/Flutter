import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/counter3/counter3_provider.dart';

class SecondScreen extends StatelessWidget
{
    const SecondScreen({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Second Screen')
            ),
            body: Center(
                child: Column(
                  spacing: 15,
                    children: [
                        Consumer<Counter3Provider>(
                            builder: (context, provider, child)
                            {
                                return Text(provider.count.toString(), style: Theme.of(context).textTheme.displayLarge);
                            }
                        ),
                        IconButton(onPressed: ()
                            {
                                Provider.of<Counter3Provider>(context, listen: false).increment();
                            }, icon: Icon(Icons.add))
                    ]
                )
            )
        );
    }
}
