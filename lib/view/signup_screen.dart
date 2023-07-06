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
import 'package:polaris_suite_app/view_model/auth_view_model.dart';
import 'package:provider/provider.dart';

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
  final _formKey = GlobalKey<FormState>();

  // validate email
  String? validateEmail(String? value) {
    const pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
        r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
        r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
        r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
        r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
        r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
        r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
    final regex = RegExp(pattern);

    return value!.isNotEmpty && !regex.hasMatch(value)
        ? 'Enter a valid email address'
        : null;
  }

  //diposing the varaibles
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _userNameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 15,
          ),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Form(
              key: _formKey,
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
                          onFiledSubmittedValue: (newValue) {
                            Utils.fieldFocus(
                                context, _emailFocusNode, _userNameFocusNode);
                          },
                          onValidator: (value) {
                            if (value.isEmpty || value == null) {
                              return 'Enter valid email';
                            }
                            return null;
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
                          onFiledSubmittedValue: (newValue) {
                            Utils.fieldFocus(context, _userNameFocusNode,
                                _passwordFocusNode);
                          },
                          onValidator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Enter valid username';
                            }
                            return null;
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
                          onFiledSubmittedValue: (newValue) {
                            Utils.fieldFocus(context, _passwordFocusNode,
                                _confirmPasswordFocusNode);
                          },
                          onValidator: (value) {
                            final RegExp regex = RegExp('[a-zA-Z]');
                            if (value == null ||
                                value.length < 8 ||
                                value.isEmpty ||
                                !regex.hasMatch(value)) {
                              return 'Must have letters and 8 Characters';
                            }
                            return null;

                            // if (value == null || value.isEmpty) {
                            //   return 'Enter valid password';
                            // }
                            // return null;
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
                          onFiledSubmittedValue: (_) {},
                          onValidator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                _confirmPasswordController ==
                                    _passwordController) {
                              return 'Password didnot match';
                            }
                            return null;
                          },
                        ),
                        vSizedBox3,
                        CustomButton(
                          btntxt: 'Register',
                          btntxtColor: Colors.white,
                          isloading: authProvider.isloading,
                          color: AppColors.primaryColor,
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              authProvider.register(
                                  _emailController.text.toString(),
                                  _userNameController.text.toString(),
                                  _passwordController.text.toString(),
                                  context);

                              //clear text fields
                              _emailController.clear();
                              _userNameController.clear();
                              _passwordController.clear();
                              _confirmPasswordController.clear();
                            }
                          },
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
      ),
    );
  }
}
