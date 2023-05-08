import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_divider.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/images/images.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';
import 'package:polaris_suite_app/utils/utils.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _userNameController = TextEditingController();
  final FocusNode _userNameFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final FocusNode _confirmPasswordFocusNode = FocusNode();
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
                      CustomTextField(
                        textEditingController: _emailController,
                        focusNode: _emailFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: false,
                        onValidator: (value) {
                          if (value.isEmpty || value == null) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                        onFiledSubmittedValue: (newValue) {
                          Utils.fieldFocus(
                              context, _emailFocusNode, _userNameFocusNode);
                        },
                      ),
                      vSizedBox2,
                      const Text(
                        'Username',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(
                        textEditingController: _userNameController,
                        focusNode: _userNameFocusNode,
                        keyboardType: TextInputType.name,
                        obscureText: false,
                        onValidator: (value) {
                          if (value == null) {
                            return 'Enter valid username';
                          }
                          return null;
                        },
                        onFiledSubmittedValue: (newValue) {
                          Utils.fieldFocus(
                              context, _userNameFocusNode, _passwordFocusNode);
                        },
                      ),
                      vSizedBox2,
                      const Text(
                        'Password',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(
                        textEditingController: _passwordController,
                        focusNode: _passwordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onValidator: (value) {
                          if (value == null) {
                            return 'Enter valid password';
                          }
                          return null;
                        },
                        onFiledSubmittedValue: (newValue) {
                          Utils.fieldFocus(context, _passwordFocusNode,
                              _confirmPasswordFocusNode);
                        },
                      ),
                      vSizedBox2,
                      const Text(
                        'Confirm Password',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(
                        textEditingController: _confirmPasswordController,
                        focusNode: _confirmPasswordFocusNode,
                        keyboardType: TextInputType.visiblePassword,
                        obscureText: true,
                        onValidator: (value) {
                          if (value == null) {
                            return 'Enter valid password';
                          }
                          return null;
                        },
                        onFiledSubmittedValue: (newValue) {},
                      ),
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
