import 'dart:convert';
import 'dart:math';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/models/project_model.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProjectScreenViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];
  List<String> projectNames = [];

  //for loading
  bool _isloading = false;
  bool get isloading => _isloading;

  void setLoading(bool val) {
    _isloading = val;
    notifyListeners();
  }

  String _selectedProject = ''; // Field to store the selected project name
  String get selectedProject => _selectedProject;

  void setSelectedProject(String project) {
    _selectedProject = project;
    notifyListeners();
  }
  //
  // List<Project> _projects = [];

  // List<Project> get projects => _projects;

  Future<void> createProject(
      String projectName, String projectDesc, BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final id = sp.getString('id');
    // print(id);
    setLoading(true);
    // print(token);
    try {
      setLoading(true);
      final response = await http.post(
        Uri.parse('$baseUrl/projects'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
        body: {
          'name': projectName,
          'description': projectDesc,
          'ownerID': id,
        },
      );
      // final decodedResp = jsonDecode(response.body);
      if (response.statusCode == 201) {
        setLoading(false);
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(
          context,
          'Project has been created',
          Colors.green.shade300,
        );
      } else {
        setLoading(false);
        // print(response.statusCode);
        // ignore: use_build_context_synchronously
        Utils.flushbarErrorMessage(context, response.toString(), AppColors.danger);
      }
    } catch (e) {
      setLoading(false);
      // ignore: use_build_context_synchronously
      Utils.flushbarErrorMessage(context, e.toString(), AppColors.danger);
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //
  Future<ProjectModel> getProjectList() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');
    final id = sp.getString('id');
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/projects/user/$id'),
        headers: <String, String>{
          'Authorization': 'Bearer $token',
        },
      );
      final decodedResp = jsonDecode(response.body);
      if (response.statusCode == 200) {
        // print('============================>>>>>>');
        print(decodedResp);
        // if (kDebugMode) {
        //   log(decodedResp);
        // }

        return ProjectModel.fromJson(decodedResp);
      } else {
        if (kDebugMode) {
          print(decodedResp);
        }
        throw Exception('Failed to load projects');
      }
    } catch (e) {
      throw Exception('Failed to load projects: $e');
    }
  }
}
