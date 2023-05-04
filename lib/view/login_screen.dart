import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_divider.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/images/images.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
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
                vSizedBox1,
                Image(image: AssetImage(backgroundImage)),
                vSizedBox1,
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Login',
                        style: AppTextStyle.textH1,
                      ),
                      vSizedBox1,
                      RichText(
                        text: const TextSpan(
                          text: "Don't have and account? ",
                          style: AppTextStyle.body,
                          children: <TextSpan>[
                            TextSpan(
                              text: 'Register now!',
                              style: AppTextStyle.bodyBlue,
                            ),
                          ],
                        ),
                      ),
                      vSizedBox3,
                      const Text(
                        'Email',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(),
                      vSizedBox2,
                      const Text(
                        'Password',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(),
                      vSizedBox2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Text(
                            "Forgot Password?",
                            style: AppTextStyle.bodyBlue,
                          ),
                        ],
                      ),
                      vSizedBox1,
                      const CustomDivider(),
                      vSizedBox2,
                      CustomButton(
                        btntxt: 'Google',
                        btntxtColor: AppColors.neutralDark,
                        color: Colors.white,
                        onPressed: () {},
                      ),
                      vSizedBox2,
                      CustomButton(
                        btntxt: 'Github',
                        btntxtColor: Colors.white,
                        color: AppColors.neutralDark,
                        onPressed: () {},
                      ),
                      vSizedBox2,
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
