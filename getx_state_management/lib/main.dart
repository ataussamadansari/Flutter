import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_state_management/app/routes/app_pages.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Demo",
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: AppPages.routes,
    );
  }
}
