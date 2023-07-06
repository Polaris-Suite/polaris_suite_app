import 'dart:async';

import 'package:flutter/material.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/resources/images/images.dart';
import 'package:polaris_suite_app/utils/routes/routes_name.dart';
import 'package:polaris_suite_app/view_model/token_view_model.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  SharedPreferencesToken sharedPreferencesToken = SharedPreferencesToken();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    sharedPreferencesToken.getUser().then((value) {
      if (value.token.toString() == 'null') {
        print('object inside empty token');
        Timer(const Duration(seconds: 3), () {
          Navigator.pushNamed(context, RoutesName.login);
        });
      } else {
        print('object');
        print(value.token.toString());
        // print(value.token!.access!.token.toString());
        Timer(
          const Duration(seconds: 3),
          () {
            Navigator.pushNamed(context, RoutesName.bottomNavBar);
          },
        );
      }
    }).onError((error, stackTrace) {
      print('error ayo !!');
      print(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Image(
          image: AssetImage(logoImage),
        ),
      ),
    );
  }
}
