import 'package:flutter/material.dart';
import 'package:provide_state_management/screens/main/provider/main_provider.dart';
import 'package:provide_state_management/utils/providers/theme_provider.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatelessWidget
{
    const MainScreen({super.key});

    @override
    Widget build(BuildContext context)
    {
        print('build function called');
        return Scaffold(
            appBar: AppBar(
                title: Text('Provide'),
                centerTitle: true
            ),
            body: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    Consumer<ThemeProvider>(
                        builder: (context, provider, child)
                        {
                            return DropdownButton<ThemeMode>(
                                value: provider.themeMode,
                                items: [
                                    DropdownMenuItem(
                                        value: ThemeMode.system,
                                        child: Text('System')
                                    ),
                                    DropdownMenuItem(
                                        value: ThemeMode.light,
                                        child: Text('Light')
                                    ),
                                    DropdownMenuItem(
                                        value: ThemeMode.dark,
                                        child: Text('Dark')
                                    )
                                ],
                                onChanged: (value)
                                {
                                    provider.switchTheme(value!);
                                }
                            );
                        }
                    ),
                    Expanded(
                        child: Center(
                            child: Consumer<MainProvider>(
                                builder: (context, provider, child)
                                {
                                    return Text(
                                        provider.count.toString(),
                                        style: TextStyle(fontSize: 40)
                                    );
                                }
                            )
                        )
                    )
                ]
            ),
            floatingActionButton: FloatingActionButton(
                onPressed: ()
                {
                    Provider.of<MainProvider>(context, listen: false).increment();
                },
                child: Icon(Icons.add)
            )
        );
    }
}
