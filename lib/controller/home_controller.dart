
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mygallery/core/constant/colors.dart';
import 'package:mygallery/core/constant/connection_status.dart';
import 'package:mygallery/core/constant/routes.dart';
import 'package:mygallery/core/functions/mySnackbar.dart';
import 'package:mygallery/data/datasources/remote/home_provider.dart';
import 'package:mygallery/data/model/data_model.dart';
import 'package:mygallery/view/widgets/home/home_btn.dart';

class HomeController extends GetxController {
  final box = GetStorage();
  //String? pickedImage;
  @override
  void onInit() {

    super.onInit();
    getImages();
  }

  File? pickedFileImage;
  pickImage(int imageType) async {
    // 0 ---> gallery
    //camera -----> 1
    var file = await ImagePicker().pickImage(
        source: imageType == 0 ? ImageSource.gallery : ImageSource.camera);
    if (file != null) {
      pickedFileImage = File(file.path);
    }
  }

  ConnectionStatus connectionStatus = ConnectionStatus.NONE;

  postImage(int imageType) async {
    await pickImage(imageType);

    if (pickedFileImage != null) {
      // ConnectionStatus connectionStatus = ConnectionStatus.LOADING;
      // update();
      var response =
          await HomeProvider(Get.find()).postImage({'img': pickedFileImage});
      if (response is ConnectionStatus) {
        //connectionStatus = response;
        mySnackBar(
            title: 'Error',
            message: response == ConnectionStatus.SERVERFAILURE
                ? 'server failure'
                : 'offline failure',
            color: AppColors.error,
            icon: Icons.error_outline_outlined);
      } else {
        if (cast<DataModel>(response).status == 'success') {
         // connectionStatus = ConnectionStatus.SUCCESS;
          mySnackBar(
              title: 'Success',
              message: 'Image uploaded successfully',
              color: AppColors.success,
              icon: Icons.check_circle_outline_sharp);
        }
      }
      // connectionStatus = ConnectionStatus.NONE;
      // update();
    }
  }
  
  List<String> images=[];

  getImages()async{
  connectionStatus = ConnectionStatus.LOADING;
  update();
  var response = await HomeProvider(Get.find()).getImages();
    if (response is ConnectionStatus) {
        connectionStatus = response;
        // mySnackBar(
        //     title: 'Error',
        //     message: response == ConnectionStatus.SERVERFAILURE
        //         ? 'server failure'
        //         : 'offline failure',
        //     color: AppColors.error,
        //     icon: Icons.error_outline_outlined);
         update();
      } else {
        if (cast<DataModel>(response).status == 'success') {
          connectionStatus = ConnectionStatus.SUCCESS;
          images.addAll(cast<DataModel>(response).data!.images!);
          // mySnackBar(
          //     title: 'Success',
          //     message: 'Image uploaded successfully',
          //     color: AppColors.success,
          //     icon: Icons.check_circle_outline_sharp);
           update();
        }
      }
     

  }
  logOut() {
    box.erase();
    Get.toNamed(AppRoutes.LOGIN);
  }

  uploadImage() {
    Get.defaultDialog(
      title: '',
      //backgroundColor: AppColors.white.withOpacity(0.0),
      titlePadding: EdgeInsets.zero,
      content: Container(
        padding: const EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        child: Column(
          children: [
            HomeButton(
                btnColor: AppColors.primary.withOpacity(0.3),
                iconColor: AppColors.primary.withOpacity(0.3),
                text: 'Gellary',
                function:(){} ,//postImage(0),
                icon: Icons.image_rounded,
                btnPaddingH: 10.0,
                btnPaddingV: 10.0,
                isBold: true,
                  titleSize: 25.0,
                
                ),
            const SizedBox(
              height: 30.0,
            ),
            HomeButton(
                btnColor: AppColors.white,
                iconColor: AppColors.primary.withOpacity(0.3),
                text: 'Camera',
                function: (){} ,//postImage(1),
                icon: Icons.camera_alt_outlined,
                btnPaddingH: 10.0,
                btnPaddingV: 10.0,
                isBold: true,
                  titleSize: 25.0,
                ),
          ],
        ),
      ),
    );
  }
}
