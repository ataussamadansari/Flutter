
import 'package:api_with_getx/app/modules/details/controllers/details_controller.dart';
import 'package:get/get.dart';

class DetailsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<DetailsController>(() => DetailsController());
  }
}