import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginUserDataPrefs {
  static checkIfLoggedIn() async {
    SharedPreferences loginpref = await SharedPreferences.getInstance();
    bool? check = await loginpref.getBool('loggedin');
    return check;
  }

  static saveLoginDatatoDevice(Userdata user) async {
    SharedPreferences loginpref = await SharedPreferences.getInstance();
    loginpref.setBool('loggedin', true);
    loginpref.setString('fullname', user.fullname!);
    loginpref.setString('contact', user.contact!);
    loginpref.setString('email', user.email!);
    loginpref.setString('username', user.username!);
    loginpref.setString('password', user.password!);
    print('prefs saved');
    print(loginpref.getString('username'));
  }

  static getSavedLoginData() async {
    SharedPreferences loginpref = await SharedPreferences.getInstance();
    String? fullname = loginpref.getString('fullname');
    String? username = loginpref.getString('username');

    String? password = loginpref.getString('password');
    String? email = loginpref.getString('email');
    String? contact = loginpref.getString('contact');
    Userdata saved_userinfo = Userdata(
        username: username,
        password: password,
        email: email,
        contact: contact,
        fullname: fullname);
    return saved_userinfo;
  }

  static removeDataFromDevice() async {
    SharedPreferences loginpref = await SharedPreferences.getInstance();
    loginpref.remove('fullname');
    loginpref.remove('contact');
    loginpref.remove('email');
    loginpref.remove('password');
    loginpref.remove('username');
    loginpref.setBool('loggedin', false);
  }
}
