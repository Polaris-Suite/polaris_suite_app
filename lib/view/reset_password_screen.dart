import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/images/images.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.black, //change your color here
        ),
        backgroundColor: Colors.grey.shade200,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(backgroundImage)),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Reset Password',
                        style: AppTextStyle.textH1,
                      ),
                      vSizedBox1,
                      RichText(
                        text: const TextSpan(
                          text: "Already have an account? ",
                          style: AppTextStyle.body,
                        ),
                      ),
                      vSizedBox3,
                      const Text(
                        'Password',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(),
                      vSizedBox2,
                      const Text(
                        'Confirm Password',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(),
                      vSizedBox3,
                      CustomButton(
                        btntxt: 'Confirm',
                        btntxtColor: Colors.white,
                        color: AppColors.primaryColor,
                        onPressed: () {},
                      ),
                      vSizedBox3,
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
