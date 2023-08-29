import 'package:flutter/foundation.dart';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/models/dashboard_model.dart';
import 'package:polaris_suite_app/models/shortcuts_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ShortcutsViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];

  Future<ShortcutsModel> getShortCutsData() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final id = sp.getString('id');
    // final email = sp.getString('email');

    final response = await http.get(
      Uri.parse('$baseUrl/shortcuts/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final decodedResp = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ShortcutsModel.fromJson(decodedResp);
    } else {
      print(response.statusCode.toString());
    }
    return ShortcutsModel.fromJson(decodedResp);
  }
}
