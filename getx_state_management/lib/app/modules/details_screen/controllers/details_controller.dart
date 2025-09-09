import 'package:get/get.dart';
import 'package:getx_state_management/app/data/models/product_model.dart';

class DetailsController extends GetxController {
  late ProductModel product;

  @override
  void onInit() {
    super.onInit();
    product = Get.arguments as ProductModel;
  }

  void goBack() {
    Get.back();
  }

}