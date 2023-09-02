// providers.dart
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/models/project_dropdown.dart';
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ProjectProvider with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];
  List<ProjectDropDownModel> _projects = [];

  List<ProjectDropDownModel> get projects => _projects;

  Future<void> fetchProjects() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final id = sp.getString('id');
    final response = await http.get(
      Uri.parse('$baseUrl/projects/user/$id'),
      headers: {
        'Authorization': 'Bearer $token',
      },
    );
    final data = json.decode(response.body);

    final projectList = (data['projects'] as List)
        .map((projectData) => ProjectDropDownModel(
              projectData['_id'],
              projectData['name'],
            ))
        .toList();

    _projects = projectList;
    notifyListeners();
  }
}
