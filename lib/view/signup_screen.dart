import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_divider.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/images/images.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
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
                        'Register',
                        style: AppTextStyle.textH1,
                      ),
                      vSizedBox1,
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Already have an account? ",
                            style: AppTextStyle.body,
                            children: <TextSpan>[
                              TextSpan(
                                text: 'login',
                                style: AppTextStyle.bodyBlue,
                              ),
                            ],
                          ),
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
                        'Username',
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
                      const Text(
                        'Confirm Password',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(),
                      vSizedBox3,
                      CustomButton(
                        btntxt: 'Register',
                        btntxtColor: Colors.white,
                        color: AppColors.primaryColor,
                        onPressed: () {},
                      ),
                      vSizedBox2,
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
