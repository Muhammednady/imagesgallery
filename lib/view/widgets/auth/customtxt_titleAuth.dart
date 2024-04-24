import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mygallery/core/constant/colors.dart';

class CustomTitleAuthText extends StatelessWidget {
  final String title;
  final double fontSize;

  const CustomTitleAuthText(
      {super.key, required this.title, required this.fontSize});
  @override
  Widget build(BuildContext context) {
    return Text(
      textAlign: TextAlign.center,
      title,
      style: TextStyle(
        height: 1.2,
          wordSpacing: 2,
          color: AppColors.black.withOpacity(0.6),
          fontSize: fontSize,
          fontWeight: FontWeight.w900),
    );
  }
}
