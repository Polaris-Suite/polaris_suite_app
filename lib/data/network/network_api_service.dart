import 'dart:convert';
import 'dart:io';

import 'package:polaris_suite_app/data/app_exception.dart';
import 'package:polaris_suite_app/data/network/base_api_services.dart';
import 'package:http/http.dart' as http;

class NetworkApiServices extends BaseApiServices {
  @override
  Future getGetApiResponse(String url) async {
    dynamic resposneJson;
    try {
      final respone = await http
          .get(
            Uri.parse(url),
          )
          .timeout(const Duration(seconds: 20));
      resposneJson = returnResponse(respone);
    } on SocketException {
      throw FetchDataExcetion('No Internet Connection');
    }
    return resposneJson;
  }

  @override
  Future getPostApiResponse(String url, data) async {
    dynamic responseJson;
    try {
      final response = await http.post(
        Uri.parse(url),
        body: data,
      );
      responseJson = returnResponse(response);
    } on SocketException {
      throw FetchDataExcetion('No Internet Connection');
    }
    return responseJson;
  }

  //json Decode
  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        dynamic responseJson = jsonDecode(response.body);
        return responseJson;
      case 400:
        throw BadRequestException(response.statusCode.toString());
      case 404:
        throw BadRequestException(response.statusCode.toString());
      default:
        // ignore: prefer_adjacent_string_concatenation
        throw FetchDataExcetion('Error Occured while communicaton with server' +
            'with status code' +
            response.statusCode.toString());
    }
  }
}
