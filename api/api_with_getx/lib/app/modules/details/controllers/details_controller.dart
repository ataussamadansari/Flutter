import 'package:api_with_getx/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

import '../../../core/helpers.dart';
import '../../../data/models/user_model.dart';

class DetailsController extends GetxController
{

    final UserRepository _userRepository = UserRepository();

    // Reactive Variables
    final RxBool isLoading = false.obs;
    final Rx<UserModel?> user = Rx<UserModel?>(null);

    @override
    void onInit() 
    {
        super.onInit();
        final int userId = Get.arguments;
        getUserById(userId);
    }

    Future<void> getUserById(int id) async
    {
        try
        {
            isLoading.value = true;
            final response = await _userRepository.getUserById(id);

            if (response.success && response.data != null) 
            {
                user.value = response.data;
            }
            else 
            {
                AppHelpers.showSnackBar(title: "Error", message: response.message, isError: true);
            }
        }
        catch(e)
        {
            AppHelpers.showSnackBar(title: 'Error', message: 'An error occurred while fetching user details!', isError: true);
        }
        finally
        {
            isLoading.value = false;
        }
    }

}
