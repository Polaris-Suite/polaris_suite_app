import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class NotificationViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];

  Future<void> getActivities() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final id = sp.getString('id');
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/activities'),
        headers: {
          'Authorization': 'Bearer $token',
        },
      );
      final decodedResp = jsonDecode(response.body.toString());
      if (response.statusCode == 200) {
        print(decodedResp.toString());
        print(response.statusCode.toString());
      } else {
        print(response.statusCode.toString());
      }
    } catch (e) {
      print(e);
    }
  }
}
