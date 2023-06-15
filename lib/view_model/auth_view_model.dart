import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:polaris_suite_app/repository/auth_repository.dart';
import 'package:polaris_suite_app/resources/colors/colors.dart';
import 'package:polaris_suite_app/utils/utils.dart';

class AuthViewModel with ChangeNotifier {
  final _myRepo = AuthRepositoryServices();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  setLoading(bool value) {
    _isLoading = value;
    ChangeNotifier();
  }

  //for register
  Future<void> registerApi(dynamic data, BuildContext context) async {
    setLoading(true);
    _myRepo.regsiterApi(data).then((value) {
      setLoading(false);
      Utils.flushbarErrorMessage(
          context,
          'You account has been registered \n Now you can login.',
          AppColors.success);
      if (kDebugMode) {
        print(value.toString());
      }
    }).onError((error, stackTrace) {
      setLoading(false);
      Utils.flushbarErrorMessage(
          context, 'Unable to register', AppColors.danger);
      if (kDebugMode) {
        print(error.toString());
      }
    });
  }
}
