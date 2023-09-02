import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/utils/utils.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CommentViewModel with ChangeNotifier {
  //baser url
  String? baseUrl = dotenv.env['Local_Host'];
  List getComment = [];

  Future<void> postComment(
      String testcaseId, String comment, String userId, BuildContext context) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    final token = sp.getString('token');

    final reponse = await http.post(
      Uri.parse('$baseUrl/comments/$testcaseId'),
      headers: <String, String>{
        'Authorization': 'Bearer $token',
      },
      body: {
        'comment': comment,
        'userId': userId,
      },
    );
    if (reponse.statusCode == 201) {
      print('SUCCESS');
      // final decodedResp = jsonDecode(reponse.body.toString());
      // getComment = decodedResp;
    } else {
      // ignore: use_build_context_synchronously
      Utils.flushbarErrorMessage(
          context, 'Some internal Error Occured', AppColors.danger);
    }
  }

  //   Future<void> getComment(
  //     String testcaseId, String comment, String userId, BuildContext context) async {
  //   SharedPreferences sp = await SharedPreferences.getInstance();
  //   final token = sp.getString('token');

  //   final reponse = await http.post(
  //     Uri.parse('$baseUrl/comments/$testcaseId'),
  //     headers: <String, String>{
  //       'Authorization': 'Bearer $token',
  //     },
  //     body: {
  //       'comment': comment,
  //       'userId': userId,
  //     },
  //   );
  //   if (reponse.statusCode == 201) {
  //     print('SUCCESS');
  //   } else {
  //     // ignore: use_build_context_synchronously
  //     Utils.flushbarErrorMessage(
  //         context, 'Some internal Error Occured', AppColors.danger);
  //   }
  // }
}
