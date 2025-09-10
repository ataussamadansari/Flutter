import 'package:api_with_getx/app/data/services/storage_services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

main() async{
  // init getStorage
  await GetStorage.init();
  await _initServices();

  runApp(MyApp());
}

Future<void> _initServices() async {
  await Get.putAsync<StorageServices>(() async => StorageServices());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "GetX Demo",
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      getPages: AppPages.route,
    );
  }
}