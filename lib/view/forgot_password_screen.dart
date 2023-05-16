import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/components/custom_divider.dart';
import 'package:polaris_suite_app/resources/components/custom_textfield.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/images/images.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _forgotPasswordController =
      TextEditingController();
  final FocusNode _forgotPasswordFocusNode = FocusNode();
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
                        'Forgot Password',
                        style: AppTextStyle.textH1,
                      ),
                      vSizedBox1,
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, RoutesName.login);
                        },
                        child: RichText(
                          text: const TextSpan(
                            text: "Enter your mail to receive reset link",
                            style: AppTextStyle.body,
                          ),
                        ),
                      ),
                      vSizedBox3,
                      const Text(
                        'Email',
                        style: AppTextStyle.body,
                      ),
                      CustomTextField(
                        textEditingController: _forgotPasswordController,
                        focusNode: _forgotPasswordFocusNode,
                        keyboardType: TextInputType.emailAddress,
                        obscureText: true,
                        onValidator: (value) {
                          if (value == null) {
                            return 'Enter valid email';
                          }
                          return null;
                        },
                        onFiledSubmittedValue: (newValue) {},
                      ),
                      vSizedBox2,
                      CustomButton(
                        btntxt: 'Reset',
                        btntxtColor: Colors.white,
                        color: AppColors.primaryColor,
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RoutesName.resetPassword);
                        },
                      ),
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
