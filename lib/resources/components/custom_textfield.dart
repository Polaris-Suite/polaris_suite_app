import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
    required this.textEditingController,
    required this.focusNode,
    required this.keyboardType,
    required this.obscureText,
    required this.onValidator,
    required this.onFiledSubmittedValue,
    this.enable = true,
    this.autofocus = true,
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
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 8.0,
          right: 8.0,
          bottom: 7.0,
        ),
        child: Center(
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
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
