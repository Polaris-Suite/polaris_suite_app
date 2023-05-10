import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.keyboardType,
    required this.obscureText,
    required this.onValidator,
    required this.onFiledSubmittedValue,
    this.enable = false,
    this.autofocus = false,
  });

  final TextEditingController? textEditingController;
  final FocusNode focusNode;
  final TextInputType keyboardType;
  final bool obscureText;
  final FormFieldValidator onValidator;
  final FormFieldSetter onFiledSubmittedValue;
  final bool enable, autofocus;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: textEditingController,
        focusNode: focusNode,
        keyboardType: keyboardType,
        obscureText: obscureText,
        validator: onValidator,
        style: const TextStyle(
          color: AppColors.neutralDark,
        ),
        decoration: const InputDecoration(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
              borderSide: BorderSide(
                color: AppColors.primaryColor,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(4),
              )),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.primaryColor,
            ),
            borderRadius: BorderRadius.all(
              Radius.circular(4),
            ),
          ),
        ),
      ),
    );
  }
}
