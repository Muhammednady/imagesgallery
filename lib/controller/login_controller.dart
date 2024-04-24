
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:get/get_utils/src/get_utils/get_utils.dart';
import 'package:get_storage/get_storage.dart';

import '../core/constant/allApp_constants.dart';
import '../core/constant/colors.dart';
import '../core/constant/connection_status.dart';
import '../core/constant/routes.dart';
import '../core/functions/mySnackbar.dart';
import '../data/datasources/remote/auth/login_provider.dart';
import '../data/model/users_model.dart';

class LoginController extends GetxController {
  static LoginController get I => Get.put(LoginController());

  TextEditingController? emailController;
  TextEditingController? passwordController;
  GlobalKey<FormState>? formkey;
  final box = GetStorage();
  @override
  void onInit() {
    emailController = TextEditingController();
    passwordController = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.onInit();
  }

  String? validateEmail(email) {
    if (emailController!.text.isEmpty) {
      return 'can\'t be empty';
    } else if (!GetUtils.isEmail(emailController!.text)) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  String? validatePassword(password) {
    if (passwordController!.text.isEmpty) {
      return 'can\'t be empty';
    } else if (passwordController!.text.length < 8 ||
        passwordController!.text.length > 16) {
      return 'Enter a valid email';
    } else {
      return null;
    }
  }

  LoginProvider loginProvider = LoginProvider(crud: Get.find());
  RxBool isLoading = false.obs; //another solution for loading
  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  login() async {
    isLoading.value = true;
    ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
    update();

    if (formkey!.currentState!.validate()) {
      var response = await loginProvider.postData({
        'email': emailController!.text,
        'password': passwordController!.text
      });

      if (response is ConnectionStatus) {
        connectionStatus = response;
        isLoading.value = false;
        mySnackBar(title: 'Error', message: response == ConnectionStatus.SERVERFAILURE
                ? 'server failure'
                : 'offline failure', color: AppColors.error, icon: Icons.error_outline);
     
      } else {
        isLoading.value = false;

        // if(response['error_message'] == ' Invalid Credntials'){
        //   mySnackBar(title: 'Error', message:'Invalid Credntials', color: AppColors.error, icon: Icons.error_outline_outlined);

        // }else{
        connectionStatus = ConnectionStatus.SUCCESS;
        Get.offAllNamed(AppRoutes.home);
       
        box.write(USER_MODEL, cast<UserModel>(response).toJson());

         mySnackBar(title: 'Success', message:'Login successfully', color: AppColors.success, icon: Icons.verified_outlined);
      //  }

     
      }
    } else {
      isLoading.value = false;
      ConnectionStatus connectionStatus = ConnectionStatus.NONE;
    }
    update();
  }

  void goToHome() {
    Get.offNamed(AppRoutes.home);
  }

  get back => Get.back();

  @override
  void dispose() {
    emailController!.dispose();
    passwordController!.dispose();
    super.dispose();
  }
}
