import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/app/modules/home_screen/controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Products'),
      ),
      body: Obx(() => ListView.builder(
        itemCount: controller.products.length,
          itemBuilder: (context, index) {
          final product = controller.products[index];
          return Card(
            margin: EdgeInsets.all(8),
            child: ListTile(
              title: Text(product.name),
              subtitle: Text("Rs. ${product.price}"),
              trailing: Icon(Icons.arrow_forward_ios),
              onTap: () => controller.goToProductDetails(product),
            ),
          );
        }
      )),
    );
  }
}