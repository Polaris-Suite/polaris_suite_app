import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DetailsViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];

  Future<void> updateProject(String name, String desc, BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final projectId = sp.getString('pid');
    try {
      final response = await http.patch(
        Uri.parse('$baseUrl/projects/$projectId'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': name.toString(),
          'description': desc.toString(),
        },
      );

      final decodedResp = jsonDecode(response.body.toString());
      print(decodedResp);
      if (response.statusCode == 200) {
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(
            context, 'Envrionment has been created', Colors.green.shade300);
      } else {
        print(response.statusCode.toString());
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
}
