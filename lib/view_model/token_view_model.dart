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
  Future<Access> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? token = sp.getString('token');
    // return token;
    return Access(token: token);
  }

  //removerUser
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('token');
    return true;
  }
}
