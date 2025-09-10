import 'package:api_with_getx/app/core/helpers.dart';
import 'package:api_with_getx/app/data/models/user_model.dart';
import 'package:api_with_getx/app/data/repositories/user_repository.dart';
import 'package:get/get.dart';

class HomeController extends GetxController
{
    final UserRepository _userRepository = UserRepository();

    // Reactive Variables
    final RxList<UserModel> users = <UserModel>[].obs;
    final RxBool isLoading = false.obs;
    final RxBool hasError = false.obs;
    final RxString errorMessage = "".obs;

    @override
    void onInit() 
    {
        super.onInit();
        fetchUsers();
    }

    Future<void> fetchUsers() async
    {
        try
        {
            isLoading.value = true;
            hasError.value = false;
            errorMessage.value = "";

            final response = await _userRepository.getUsers();

            if (response.success && response.data != null) 
            {
                users.assignAll(response.data!);
            }
            else 
            {
                hasError.value = true;
                errorMessage.value = response.message;
                AppHelpers.showSnackBar(title: "Error", message: response.message, isError: true);
            }
        }
        catch (e)
        {
            hasError.value = true;
            errorMessage.value = "An unexpected error occurred.";
            AppHelpers.showSnackBar(title: "Error", message: errorMessage.value, isError: true);
        }
        finally
        {
            isLoading.value = false;
        }
    }

    // its for refreshing users
    Future<void> refreshUsers() async
    {
        await fetchUsers();
    }

    Future<UserModel?> getUserById(int id) async
    {
        try
        {
            isLoading.value = true;
            final response = await _userRepository.getUserById(id);

            if (response.success && response.data != null) 
            {
                return response.data;
            }
            else 
            {
                AppHelpers.showSnackBar(title: 'Error', message: response.message, isError: true);
                return null;
            }
        }
        catch (e)
        {
            AppHelpers.showSnackBar(title: 'Error', message: 'An error occurred while fetching user details!', isError: true);
        }
        finally
        {
            isLoading.value = false;
        }
        return null;
    }

    // its for delete user
    Future<void> deleteUser(int id) async
    {
        try
        {
            isLoading.value = true;
            final response = await _userRepository.deleteUser(id);

            if (response.success) 
            {
                users.removeWhere((user) => user.id == id);
                AppHelpers.showSnackBar(title: 'Success', message: 'User deleted successfully!', isError: false);
            }
            else 
            {
                AppHelpers.showSnackBar(title: 'Error', message: response.message, isError: true);
            }
        }
        catch (e)
        {
            AppHelpers.showSnackBar(title: 'Error', message: 'An error occurred while deleting user!', isError: true);
        }
        finally
        {
            isLoading.value = false;
        }
    }

    // Navigate
    void navigateToDetails(int id) {
        Get.toNamed('/details', arguments: id);
    }
}
