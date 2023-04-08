import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

import '../style/text_style.dart';
import '../theme/app_colors.dart';

var maskFormatter =  MaskTextInputFormatter(
  mask: '+994 (###) ###-##-##', 
  filter: { "#": RegExp(r'[0-9]') },
);

class GlobalFormInput extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focus;
  final void Function(String) onChanged;
  final String? Function(String?) validator;
  final String? errorText;
  final String? hintText;
  final String? labelText;
  final TextInputType keyboardType;
  final bool obscureText;


   const GlobalFormInput({
    Key? key,
    required this.controller,
    required this.focus,
    required this.onChanged,
    required this.keyboardType,
    required this.validator,
    this.hintText, 
    this.labelText, 
    this.obscureText=false,
    this.errorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [maskFormatter],
      obscureText:obscureText,
      onChanged: onChanged,
      keyboardType:keyboardType,
      validator: validator,
      controller: controller,
      focusNode: focus,
      cursorColor: AppColors.darkGrey,
      decoration: InputDecoration(
         hintText: hintText,
         labelText: labelText,
         labelStyle:AppTextStyle.labelText,
        errorStyle:  TextStyle(
          fontSize: 14.sp,
          color: AppColors.pink,
        ),
      ),
    );
  }
}