// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mygallery/core/constant/colors.dart';

mySnackBar({
  required String title,
  required String message,
  required Color color,
  required IconData icon,
}) =>
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.TOP,
      backgroundColor: color,
      colorText: AppColors.white,
      margin: const EdgeInsets.only(left: 20, right: 20, top: 100),
      borderRadius: 8,
      animationDuration: const Duration(milliseconds: 1000),
      duration: const Duration(milliseconds: 1000),
      icon: Icon(icon, color: AppColors.white),
      leftBarIndicatorColor: AppColors.primary,
      shouldIconPulse: true,
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      forwardAnimationCurve: Curves.easeInOutCubicEmphasized,
      reverseAnimationCurve: Curves.fastOutSlowIn,
    );
