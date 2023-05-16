import 'package:flutter/widgets.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class CustomDivider extends StatelessWidget {
  const CustomDivider({super.key});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width * 1;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: width * 0.35,
          height: 1,
          child: Container(
            color: AppColors.neutralDark,
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.1,
          child: const Center(
            child: Text(
              "OR",
              style: AppTextStyle.body,
            ),
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.35,
          height: 1,
          child: Container(
            color: AppColors.neutralDark,
          ),
        ),
      ],
    );
  }
}
