import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/components/custom_button.dart';
import 'package:polaris_suite_app/resources/dimensions/dimensions.dart';
import 'package:polaris_suite_app/resources/styles/text_styles.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';
import 'package:polaris_suite_app/view_model/token_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 25,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'Profile Screen',
                style: AppTextStyle.textH2,
              ),
              vSizedBox2,
              CustomButton(
                color: AppColors.primaryColor,
                btntxt: 'Log out',
                onPressed: () {
                  // SharedPreferencesToken sharedPreferencesToken =
                  //     SharedPreferencesToken();
                  // sharedPreferencesToken.removeUser();
                  // Navigator.pushNamed(context, RoutesName.login);
                },
                btntxtColor: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
