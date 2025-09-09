import 'package:get/get.dart';
import 'package:getx_state_management/app/modules/details_screen/binding/details_binding.dart';
import 'package:getx_state_management/app/modules/details_screen/views/details_view.dart';
import 'package:getx_state_management/app/modules/home_screen/bindings/home_binding.dart';
import 'package:getx_state_management/app/modules/home_screen/views/home_view.dart';

class AppPages {
  static final routes = [
    GetPage(name: '/home', page:() => HomeView(), binding: HomeBinding()),
    GetPage(name: '/product-details', page:() => DetailsView(), binding: DetailsBinding())
  ];
}