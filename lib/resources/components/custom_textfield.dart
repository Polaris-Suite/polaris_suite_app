import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';

class CustomTextField extends StatelessWidget {
  CustomTextField({
    super.key,
  });

  // TextEditingController? textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(3),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 8.0,
          vertical: 5,
        ),
        child: TextFormField(
          style: const TextStyle(
            color: AppColors.neutralDark,
          ),
          decoration: const InputDecoration(
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }
}
