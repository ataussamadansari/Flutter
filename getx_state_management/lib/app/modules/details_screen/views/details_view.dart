import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/app/modules/details_screen/controllers/details_controller.dart';

class DetailsView extends GetView<DetailsController>
{
    const DetailsView({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(title: Text('Product Details'), backgroundColor: Colors.green),
            body: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                  spacing: 8,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                      Text(controller.product.name, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text(controller.product.description),
                      Text("Rs. ${controller.product.price}", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.green))
                  ]
              ),
            )
        );
    }
}
