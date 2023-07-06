import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/utils/utils.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';

class AuthProvider with ChangeNotifier {
  //for url
  // String? url = dotenv.env['BACKEND_URL_WITH_PORT'];

  //for loading
  bool _isloading = false;
  bool get isloading => _isloading;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  //Register
  void register(
      String email, String name, String password, BuildContext context) async {
    setLoading(true);
    try {
      final resp = await http.post(
        Uri.parse('/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
          'name': name,
        }),
      );
      if (resp.statusCode == 201) {
        //
        setLoading(false);
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(
          context,
          'Account Created Successfully',
          AppColors.success,
        );
      } else {
        print(resp.statusCode.toString());
        //
        setLoading(false);
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(
            context, 'Invalid response', AppColors.neutralGray);
      }
    } catch (e) {
      setLoading(false);
      //
      print('object');
      //
      Utils.flushbarErrorMessage(
          context, e.toString(), AppColors.secondaryColor);
    }
  }

  //logi
  void login(String email, String password, BuildContext context) async {
    try {
      final response = await http.post(
        Uri.parse('/auth/register'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: jsonEncode(<String, dynamic>{
          'email': email,
          'password': password,
        }),
      );
      if (response.statusCode == 200) {
        // Utils.flushbarErrorMessage(context, mssg, color)
        // Navigator.push(context, route)
      } else {
        Utils.flushbarErrorMessage(
            context, response.statusCode.toString(), AppColors.secondaryColor);
      }
    } catch (e) {
      Utils.flushbarErrorMessage(
          context, e.toString(), AppColors.secondaryColor);
    }
  }
}
