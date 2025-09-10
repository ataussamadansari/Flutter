import 'package:api_with_getx/app/modules/details/controllers/details_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends GetView<DetailsController> {
  const DetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('User Details'),
        centerTitle: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: CircularProgressIndicator());
        }
        if (controller.user.value == null) {
          return const Center(child: Text('User not found.'));
        }
        return SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CircleAvatar(
                radius: 50,
                child: Text(controller.user.value!.name![0], style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),)
              ),
              Text(controller.user.value!.name!, style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              Text(controller.user.value!.email!),
              Text(controller.user.value!.phone!),
              SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Address:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(controller.user.value!.address!.street!),
                        Text(controller.user.value!.address!.suite!),
                        Text(controller.user.value!.address!.city!),
                        Text(controller.user.value!.address!.zipcode!),
                      ],
                    ),
                  ),
                  Flexible(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Company:", style: TextStyle(fontWeight: FontWeight.bold)),
                        Text(controller.user.value!.company!.name!),
                        Text(controller.user.value!.company!.catchPhrase!),
                        Text(controller.user.value!.company!.bs!),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }

}