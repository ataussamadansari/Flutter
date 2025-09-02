import 'package:flutter/material.dart';
import 'package:multi_provider/providers/counter1/counter1_provider.dart';
import 'package:multi_provider/providers/counter2/counter2_provider.dart';
import 'package:multi_provider/providers/counter3/counter3_provider.dart';
import 'package:multi_provider/screens/second/second_screen.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget
{
    const HomeScreen({super.key});

    @override
    State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
{
    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('Multi-Provide'),
                centerTitle: true
            ),
            body: Center(
                child: Column(
                    spacing: 15,
                    children: [
                        Consumer<Counter1Provider>(
                            builder: (context, provider, child)
                            {
                                return Text(provider.count.toString(), style: Theme.of(context).textTheme.displayLarge);
                            }
                        ),
                        ElevatedButton(
                            onPressed: ()
                            {
                                Provider.of<Counter1Provider>(context, listen: false).increment();
                            },
                            child: Text('Counter 1 Increment')
                        ),
                        Consumer<Counter2Provider>(
                            builder: (context, provider, child)
                            {
                                return Text(provider.count.toString(), style: Theme.of(context).textTheme.displayLarge);
                            }
                        ),
                        OutlinedButton(onPressed: ()
                            {
                                Provider.of<Counter2Provider>(context, listen: false).increment();
                            }, child: Text("Counter 2 Increment")),

                        ElevatedButton(
                            onPressed: ()
                            {
                                Navigator.push(
                                    context, 
                                    MaterialPageRoute(
                                        builder: (context) => ChangeNotifierProvider(
                                            create: (context) => Counter3Provider(),
                                            child: SecondScreen()
                                        )
                                    )
                                );
                            },
                            child: Text('Next Screen'))
                    ]
                )
            )
        );
    }
}
