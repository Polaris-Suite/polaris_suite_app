import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EnvironmentViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];

  Future<void> createEnvironment(String name, String desc, BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final projectId = sp.getString('pid');

    try {
      final response = await http.post(
        Uri.parse('$baseUrl/environments/$projectId'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': name.toString(),
          'description': desc.toString(),
        },
      );

      final decodedResp = jsonDecode(response.body.toString());
      if (response.statusCode == 201) {
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(
            context, 'Envrionment has been created', Colors.green.shade300);
      } else {
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(
            context, 'Something unsual has occured', Colors.red.shade300);
        // print(response.statusCode.toString());
      }
    } catch (e) {
      // print('=======================================>');
      print(e.toString());
    }
  }

  // Future<void> getEnvironment(String name, String desc, BuildContext context) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   final token = sp.getString('token');
  //   final projectId = sp.getString('pid');

  //   try {
  //     final response = await http.post(
  //       Uri.parse('$baseUrl/environments/$projectId'),
  //       headers: <String, String>{
  //         'Authorization': 'Bearer $token',
  //       },
  //       body: {
  //         'name': name.toString(),
  //         'description': desc.toString(),
  //       },
  //     );

  //     final decodedResp = jsonDecode(response.body.toString());
  //     if (response.statusCode == 201) {
  //       // ignore: use_build_context_synchronously
  //       Utils.flushbarErrorMessage(
  //           context, 'Envrionment has been created', Colors.green.shade300);
  //     } else {
  //       // ignore: use_build_context_synchronously
  //       Utils.flushbarErrorMessage(
  //           context, 'Something unsual has occured', Colors.red.shade300);
  //       // print(response.statusCode.toString());
  //     }
  //   } catch (e) {
  //     // print('=======================================>');
  //     print(e.toString());
  //   }
  // }
}
