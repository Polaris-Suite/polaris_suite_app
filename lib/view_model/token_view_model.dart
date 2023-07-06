import 'package:polaris_suite_app/models/token_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesToken {
  //set token
  Future<bool> saveUser(TokenModel tokenModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('token', tokenModel.token!.access!.token.toString());
    return true;
  }

  //getToken
  Future<TokenModel> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    dynamic token = sp.getString('token');
    return TokenModel(token: token);
  }

  //removerUser
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
