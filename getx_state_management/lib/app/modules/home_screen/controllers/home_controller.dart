import 'package:get/get.dart';
import 'package:getx_state_management/app/data/models/product_model.dart';

class HomeController extends GetxController {
  final products = <ProductModel>[].obs;

  @override
  void onInit() {
    super.onInit();
    loadProduct();
  }

  void loadProduct() {
    products.value = [
      ProductModel(id: 1, name: "iPhone iOS 16", description: "Latest iPhone iOS 16", price: 14999.00),
      ProductModel(id: 2, name: "iPhone iOS 15", description: "Latest iPhone iOS 15", price: 12999.00),
      ProductModel(id: 3, name: "iPhone iOS 14", description: "Latest iPhone iOS 14", price: 10999.00),
      ProductModel(id: 4, name: "iPhone iOS 13", description: "Latest iPhone iOS 13", price: 99999.00),
      ProductModel(id: 5, name: "iPhone iOS 12", description: "Latest iPhone iOS 12", price: 85000.00),
    ];
  }

  void goToProductDetails(ProductModel product) {
    Get.toNamed('/product-details', arguments: product);
  }
}