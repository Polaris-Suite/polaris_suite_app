import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
// import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.color,
    required this.btntxt,
    required this.onPressed,
    this.isloading = false,
    required this.btntxtColor,
  });
  final Color color;
  final String btntxt;
  final Color btntxtColor;
  bool isloading;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 40,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(4),
          boxShadow: const [
            BoxShadow(
              color: AppColors.neutralGray,
              blurRadius: 10.0,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Center(
          child: isloading == false
              ? Text(
                  btntxt,
                  style: TextStyle(
                    fontFamily: 'Sen',
                    color: btntxtColor,
                  ),
                )
              : CircularProgressIndicator(),
        ),
      ),
    );
  }
}
