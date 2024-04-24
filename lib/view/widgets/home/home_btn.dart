

import 'package:flutter/material.dart';
import 'package:mygallery/core/constant/colors.dart';

class HomeButton extends StatelessWidget {
  final Color btnColor;
  final Color iconColor;
  final double btnPaddingH;
    final double btnPaddingV;
    final bool isBold;
    final double titleSize;

  final String text;
  final IconData icon;
  final void Function() function;

  const HomeButton({super.key, required this.btnColor, required this.iconColor, required this.text, required this.function, required this.icon, required this.btnPaddingH, required this.btnPaddingV, required this.isBold, required this.titleSize});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
                elevation: 0.0,
                padding:  EdgeInsets.symmetric(vertical: btnPaddingV , horizontal: btnPaddingH),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
                color: btnColor,
                onPressed: function , child: Row(children: [
                Card(child: Container(
                  padding: const EdgeInsets.all(4.0),
                  decoration: BoxDecoration(
                    boxShadow: <BoxShadow>[ BoxShadow(offset:const Offset(1, 1),blurRadius: 2.0,color: iconColor)],
                    color: iconColor,
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Icon(icon , color: AppColors.white,))),
                const SizedBox(width: 8.0,),
                 Text(text , style: TextStyle(fontSize: titleSize,fontWeight: isBold?FontWeight.w900:null,color: AppColors.black.withOpacity(0.6)))
              ],),);
  }
}