import 'package:polaris_suite_app/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesUserEmail {
  //set token
  Future<bool> saveUser(UserModel userModel) async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.setString('email', userModel.user!.email.toString());
    return true;
  }

  //getToken
  Future<User> getUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    String? email = sp.getString('email');
    // return token;
    return User(email: email);
  }

  //removerUser
  Future<bool> removeUser() async {
    SharedPreferences sp = await SharedPreferences.getInstance();
    sp.remove('email');
    return true;
  }
}
