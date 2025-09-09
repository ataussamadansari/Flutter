import 'package:get/get.dart';
import 'package:getx_state_management/app/modules/home_screen/controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController());
  }
}