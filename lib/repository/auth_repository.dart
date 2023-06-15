import 'package:polaris_suite_app/data/network/base_api_services.dart';
import 'package:polaris_suite_app/data/network/network_api_service.dart';
import 'package:polaris_suite_app/resources/urls/app_urls.dart';

class AuthRepositoryServices {
  final BaseApiServices _apiServices = NetworkApiServices();

  Future<dynamic> loginApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginEndPoints, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }

  Future<dynamic> regsiterApi(dynamic data) async {
    try {
      dynamic response =
          await _apiServices.getPostApiResponse(AppUrls.loginEndPoints, data);
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
