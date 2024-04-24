import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:mygallery/core/constant/routes.dart';
import 'package:mygallery/view/screens/auth/login.dart';
import 'package:mygallery/view/screens/home.dart';

List<GetPage<dynamic>> routes = [
  GetPage(
      name: AppRoutes.initialRoute,
      page: () => const LogIn(),
      ),
  GetPage(name: AppRoutes.home, page: () =>  HomePage()),
  GetPage(name: AppRoutes.LOGIN, page: () => const LogIn()),
 
];