import 'package:api_with_getx/app/core/helpers.dart';
import 'package:api_with_getx/app/data/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../globle_widgets/home/user_card.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController>
{
    const HomeView({super.key});

    @override
    Widget build(BuildContext context)
    {
        return Scaffold(
            appBar: AppBar(
                title: Text('User List', style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.green,
                centerTitle: true,
              actions: [
                IconButton(onPressed: () => controller.refreshUsers(), icon: Icon(Icons.refresh, color: Colors.white))
              ],
            ),
            body: Column(
                children: [
                    Expanded(child: Obx(()
                            {
                                if (controller.isLoading.value) 
                                {
                                    return const Center(child: CircularProgressIndicator());
                                }
                                if (controller.hasError.value) 
                                {
                                    return const Center(child: Text('Error loading users.'));
                                }
                                if (controller.users.isEmpty) {
                                  return const Center(child: Text('No users found.'));
                                }
                                return ListView.builder(
                                  itemCount: controller.users.length,
                                    itemBuilder: (context, index) {
                                      final user = controller.users[index];
                                      return UserCard(
                                        user: user,
                                        onTap: () => _showUserDetails(context, user),
                                        // onLongPress: () => _showUserById(context, user.id!),
                                          onLongPress: () => controller.navigateToDetails(user.id!),
                                        onDelete: () => _showDeleteDialog(context, user)
                                      );
                                    }
                                );
                            }
                        )
                    )
                ]
            )
        );
    }
}

_showUserDetails(BuildContext context, UserModel user) {
  showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(16))
      ),
      builder: (context) => UserDetailsSheet(user: user)
  );
}

_showDeleteDialog(BuildContext context, UserModel user) {
  final controller = Get.find<HomeController>();
  showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Delete User'),
        content: Text('Are you sure want to delete ${user.name}'),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context), child: const Text('Cancel')),
          TextButton(
              onPressed: () {
            Navigator.pop(context);
            controller.deleteUser(user.id!.toInt());
          }, child: const Text('Delete', style: TextStyle(color: Colors.red),)),
        ],
      )
  );
}

_showUserById(BuildContext context, int id) async {
  final controller = Get.find<HomeController>();

  final response = await controller.getUserById(id);

  UserModel? userModel = response;

  if (userModel != null) {
    AppHelpers.showSnackBar(title: 'Success', message: "${userModel.name}");
  } else {
    AppHelpers.showSnackBar(title: 'Error', message: 'An error occurred while fetching user details!', isError: true);
  }
}
