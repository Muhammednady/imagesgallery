import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygallery/controller/login_controller.dart';
import 'package:mygallery/core/constant/colors.dart';
import 'package:mygallery/view/widgets/auth/custom_field_auth.dart';
import 'package:mygallery/view/widgets/auth/customtxt_titleAuth.dart';
import 'package:mygallery/view/widgets/auth/login_btn.dart';

import '../../../core/constant/connection_status.dart';

class LogIn extends GetView<LoginController> {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    Get.lazyPut(() => LoginController());
    return Scaffold(
      // resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 50.0),
          // margin: const EdgeInsets.symmetric(horizontal: 30.0),
          color: AppColors.primary.withOpacity(0.2),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Align(
                      alignment: Alignment.centerLeft,
                      child: Image.asset(
                        'assets/images/camera.PNG',
                        height: 100.0,
                        width: 100.0,
                        fit: BoxFit.cover,
                      )),
                  const CustomTitleAuthText(title: 'My\nGallery', fontSize: 40.0),
                  //  const CustomTitleAuthText(title: 'My' , fontSize:40.0),
                  //  const CustomTitleAuthText(title: 'Gallery' , fontSize:40.0),
                  const SizedBox(
                    height: 20.0,
                  ),
                  GetBuilder<LoginController>(
                      init: controller,
                      builder: (context) => controller.connectionStatus ==

                              ConnectionStatus.SERVERFAILURE
                          ? const Center(child: Text('Server Failure'))
                          : controller.connectionStatus ==
                                  ConnectionStatus.OFFLINEFAILURE
                              ? const Center(child: Text('Offline Failure'))
                              : Card(
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40.0)),
                                  child: Container(
                                    //height: Get.height / 0.8,
                                    //width: Get.height / 0.5,
                                    padding: const EdgeInsets.all(20.0),
                                    child: Form(
                                      key: controller.formkey,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const CustomTitleAuthText(
                                            title: 'LOG IN',
                                            fontSize: 20.0,
                                          ),
                                          CustomAuthField(
                                              hint: 'user Name',
                                              validate: controller.validateEmail,
                                              controller:
                                                  controller.emailController!,
                                              textInputType: TextInputType.name),
                                          CustomAuthField(
                                              hint: 'Password',
                                              validate:
                                                  controller.validatePassword,
                                              controller:
                                                  controller.passwordController!,
                                              textInputType:
                                                  TextInputType.name),
                                          Obx(() => controller.isLoading.value
                                              ? const Padding(
                                                padding: EdgeInsets.only(top:30.0),
                                                child: CircularProgressIndicator(
                                                    color: AppColors.primary,
                                                  ),
                                              )
                                              : LogInButton(
                                                  marginh: 10.0,
                                                  marginv: 30.0,
                                                  text: 'SUBMIT',
                                                  textColor: AppColors.white,
                                                  onClick: () {
                                                    controller.login();
                                                  },
                                                  radius: 10.0,
                                                  height: 40.0))
                                        ],
                                      ),
                                    ),
                                  )))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
