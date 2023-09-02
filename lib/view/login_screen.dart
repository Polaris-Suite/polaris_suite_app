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
import 'package:polaris_suite_app/view_model/token_view_model.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final emailFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final passwordFocusNode = FocusNode();

  //sp
  SharedPreferencesToken sharedPreferencesToken = SharedPreferencesToken();
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return WillPopScope(
      onWillPop: () async {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
        // AlertDialog(
        //   title: Text('hhhhhhh'),
        //   content: const SingleChildScrollView(
        //     child: ListBody(
        //       children: <Widget>[
        //         Text('This is a demo alert dialog.'),
        //         Text('Would you like to approve of this message?'),
        //       ],
        //     ),
        //   ),
        //   actions: <Widget>[
        //     TextButton(
        //       child: const Text('Approve'),
        //       onPressed: () {
        //         Navigator.of(context).pop();
        //       },
        //     ),
        //   ],
        // );
        // ScaffoldMessenger.of(context).showSnackBar(
        //   SnackBar(
        //     content: Text('HHHHHHHHHH'),
        //   ),
        // );
        return false;
      },
      child: Scaffold(
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
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(context, RoutesName.signup);
                            },
                            child: RichText(
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
                          ),
                          vSizedBox3,
                          const Text(
                            'Email',
                            style: AppTextStyle.body,
                          ),
                          CustomTextField(
                            textEditingController: _emailController,
                            focusNode: emailFocusNode,
                            onFiledSubmittedValue: (_) {
                              Utils.fieldFocus(
                                  context, emailFocusNode, passwordFocusNode);
                            },
                            keyboardType: TextInputType.emailAddress,
                            obscureText: false,
                            onValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter valid email';
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
                            focusNode: passwordFocusNode,
                            onFiledSubmittedValue: (_) {},
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: true,
                            onValidator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Enter valid password';
                              }
                              return null;
                            },
                          ),
                          vSizedBox3,
                          CustomButton(
                            btntxt: 'Login',
                            isloading: authProvider.isloading,
                            btntxtColor: Colors.white,
                            color: AppColors.primaryColor,
                            onPressed: () {
                              print(authProvider.isloading);
                              if (_formKey.currentState!.validate()) {
                                authProvider.login(
                                    _emailController.text.toString(),
                                    _passwordController.text.toString(),
                                    context);
                              }
                            },
                          ),
                          vSizedBox2,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.forgotPassword);
                                },
                                child: const Text(
                                  "Forgot Password?",
                                  style: AppTextStyle.bodyBlue,
                                ),
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
      ),
    );
  }
}
