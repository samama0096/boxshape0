import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UserDataFirebaseServices {
//instance for collection of authenticated users
  final _authusersDoc = FirebaseFirestore.instance.collection('auth_usersdata');
  //instance for collection of active users
  final _activeusersDoc = FirebaseFirestore.instance.collection('activeusers');

//save login status of user to active users collection!
  Future<void> saveLoginStatusOnDatabase(String username) async {
    await _activeusersDoc
        .doc(username)
        .set({"loggedin": true})
        .whenComplete(() => print(" status updated"))
        .catchError((e) => print(e));
  }

//set active status of user from login true to login false!
  Future<void> removeLoginStatusOnDatabase(String username) async {
    await _activeusersDoc
        .doc(username)
        .set({"loggedin": false})
        .whenComplete(() => print(" status updated"))
        .catchError((e) => print(e));
  }

  Future checkIfUsernamePresent(String username) async {
    DocumentSnapshot docSnap = await _authusersDoc.doc(username).get();
    if (!docSnap.exists) {
      return 200;
    } else {
      return 300;
    }
  }

  Future createNewUserInDataBase(
      {String? fullname,
      String? username,
      String? password,
      String? contact,
      String? email}) async {
    Map<String, dynamic> data = <String, dynamic>{
      "fullname": fullname,
      "username": username,
      "email": email,
      "contact": contact,
      "password": password
    };

    await _authusersDoc
        .doc(username)
        .set(data)
        .whenComplete(() => print(" added to the database"))
        .catchError((e) => print(e));
  }

  Future loginUser(String username, String password) async {
    Userdata currentuser;
    try {
      DocumentSnapshot docSnap = await _authusersDoc.doc(username).get();
      if (!docSnap.exists) {
        print("user not found");
        return 400;
      } else if (docSnap.exists) {
        currentuser = Userdata.fromDocument(docSnap);
        if (currentuser.password == password) {
          LoginUserDataPrefs.saveLoginDatatoDevice(currentuser);
          await saveLoginStatusOnDatabase(username);
          return 200;
        } else {
          print("Inc Pass");
          return 300;
        }
      }
    } on Exception catch (e) {
      print("Firebase error occured!");
    }
  }
}
