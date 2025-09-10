import 'package:get/get.dart';

import '../modules/details/bindings/details_binding.dart';
import '../modules/details/views/details_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';


class AppPages {
  static final route = [
    GetPage(name: '/home', page: ()=> HomeView(), binding: HomeBinding()),
    GetPage(name: '/details', page: ()=> DetailsView(), binding: DetailsBinding(), transition: Transition.circularReveal),
  ];
}