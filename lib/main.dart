import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:mygallery/core/classes/crud.dart';
import 'package:mygallery/core/services/myservices.dart';
import 'package:mygallery/routes.dart';
import 'package:mygallery/view/screens/auth/login.dart';
import 'package:mygallery/core/constant/allApp_constants.dart';
import 'package:mygallery/core/constant/colors.dart';
import 'package:mygallery/core/constant/routes.dart';
import 'package:mygallery/core/services/myservices.dart';
import 'package:mygallery/routes.dart';

void main() async{
  runApp(const MyApp());
  MyServices.injectMyServices();
  await GetStorage.init();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Gallery App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
        useMaterial3: true,
      ),
     // home: const LogIn(),
     getPages: routes,
     initialRoute: middleWare(),
      initialBinding: InitialBinding(),
    );
  }
}

String middleWare(){
  final box = GetStorage();
  if(box.read(USER_MODEL) != null){
    return AppRoutes.home;
  }
  return AppRoutes.LOGIN;
}
class InitialBinding extends Bindings{
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.put(Crud());
  }

}
