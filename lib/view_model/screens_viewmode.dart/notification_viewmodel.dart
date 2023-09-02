import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/models/activities_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];

  Future<ActivitiesModel> getActivities() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final id = sp.getString('id');
    final email = sp.getString('email');

    final response = await http.post(
      Uri.parse('$baseUrl/activities'),
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'email': '$email',
        'userId': '$id',
      },
    );
    final decodedResp = jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      return ActivitiesModel.fromJson(decodedResp);
    } else {
      print(response.statusCode.toString());
    }
    return ActivitiesModel.fromJson(decodedResp);
  }
}
