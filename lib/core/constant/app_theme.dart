import 'package:flutter/material.dart';

import 'colors.dart';

ThemeData appTheme = ThemeData(

    colorScheme: ColorScheme.fromSeed(seedColor: AppColors.primary),
    useMaterial3: true,
    textTheme: TextTheme(
      headline1: TextStyle(
        height: 1.6,
        fontSize: 16.0,
        color: AppColors.grey,
      ),
      headline2: TextStyle(
        fontSize: 18.0,
        color: AppColors.grey,
      ),
      bodyText1: TextStyle(
        fontSize: 22.0,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      bodyText2: TextStyle(
        fontSize: 25.0,
        color: AppColors.grey,
        fontWeight: FontWeight.bold,
      ),

    ));



