import 'dart:convert';
// import 'dart:math';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/models/testcase_models.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestCasesViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];
  Future<TestcaseModel> getTestCasesData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final projectId = sp.getString('pid');

    final response = await http.get(
      Uri.parse('$baseUrl/testcases/$projectId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
    );
    final decodedResp = jsonDecode(response.body.toString());
    print(decodedResp.toString());
    if (response.statusCode == 200) {
      print(response.statusCode.toString());
      return TestcaseModel.fromJson(decodedResp);
      // print(decodedResp);
    } else {
      print(response.statusCode.toString());
    }
    return TestcaseModel.fromJson(decodedResp);
  }
}
