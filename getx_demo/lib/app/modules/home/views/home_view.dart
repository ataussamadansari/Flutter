import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController>
{
  const HomeView({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(title: Text('GetX Demo'), backgroundColor: Colors.green),
            body: Center(
                child: ElevatedButton(
                    onPressed: () => controller.navigateToDetailsScreen(), 
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                        children: [
                            Text("Navigate to Details Screen"),
                            Icon(Icons.navigate_next)
                        ]
                    )
                )
            )
        );
    }
}
