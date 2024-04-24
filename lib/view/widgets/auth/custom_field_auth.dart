import 'package:flutter/material.dart';

import '../../../core/constant/colors.dart';

class CustomAuthField extends StatelessWidget {
  final String hint;
  final TextInputType textInputType;
  final TextEditingController controller;
  final String? Function(String?)? validate;

  CustomAuthField({
    super.key,
    required this.hint,
    required this.controller,
    required this.textInputType,
    this.validate,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: TextFormField(
        controller: controller,
        validator: validate,
        style: TextStyle(fontSize: 15.0, color: AppColors.black),
        keyboardType: textInputType,
        decoration: InputDecoration(
            fillColor: AppColors.white,
            filled: true,
            hintText: hint,
            hintStyle:
                const TextStyle(color: Colors.grey).copyWith(fontSize: 15.0),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 1.0, horizontal: 20.0),
            border:
                OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(20.0))),
      ),
    );
  }
}
