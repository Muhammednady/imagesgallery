import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class LogInButton extends StatelessWidget {
  final double marginh;
   final double marginv;
  final String text;
  final Color textColor;
  final double radius;
  final double height;
  final Function onClick;

  const LogInButton(
      {super.key,
      required this.text,
      required this.textColor,
      required this.onClick,
      required this.radius,
      required this.height, required this.marginh, required this.marginv});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            boxShadow: const [
              BoxShadow(
                //color: AppColors.primary,
                // blurRadius: 2,
                // offset: Offset(1, 1),
              ),
            ],
            color: AppColors.blue,
            borderRadius: BorderRadiusDirectional.circular(radius)),
        width: double.infinity,
        height: height,
        margin: EdgeInsets.symmetric(horizontal: marginh , vertical: marginv),
        child: TextButton(
          onPressed: () => onClick(), //onClick(),
          child: Text(
            text,
            style: TextStyle(color: textColor, fontWeight: FontWeight.w900,fontSize: 15.0),
          ),
        ));
  }
}
