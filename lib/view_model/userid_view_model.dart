import 'package:polaris_suite_app/models/token_model.dart';
import 'package:polaris_suite_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUserId {
  //set token
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('id', userModel.user!.sId.toString());
    return true;
  }

  //getToken
  Future<User> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? id = sp.getString('id');
    // return token;
    return User(sId: id);
  }

  //removerUser
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('id');
    return true;
  }
}
