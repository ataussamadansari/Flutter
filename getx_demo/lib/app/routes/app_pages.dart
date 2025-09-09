import 'package:get/get.dart';
import 'package:getx_demo/app/modules/details/bindings/details_binding.dart';
import 'package:getx_demo/app/modules/details/views/details_view.dart';
import 'package:getx_demo/app/modules/home/bindings/home_binding.dart';
import 'package:getx_demo/app/modules/home/views/home_view.dart';

class AppPages {
  static final route = [
    GetPage(name: '/home', page: ()=> HomeView(), binding: HomeBinding()),
    GetPage(name: '/details', page: ()=> DetailsView(), binding: DetailsBinding()),
  ];
}