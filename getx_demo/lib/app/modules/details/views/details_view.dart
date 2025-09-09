import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController>
{
    const DetailsView({super.key});

    @override
    Widget build(BuildContext context) 
    {
        return Scaffold(
            appBar: AppBar(title: Text('Details Screen'), backgroundColor: Colors.green),
            body: Center(
                child: ElevatedButton(
                    onPressed: () => controller.goBack(),
                    child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.arrow_back_ios),
                          Text('Navigate to Home Screen')
                        ]
                    )
                )
            )
        );
    }
}
