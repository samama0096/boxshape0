import 'package:boxshape/Firebase/services/users.firebase.dart';

import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:boxshape/UI/views/homeview.dart';
import 'package:boxshape/UI/views/signupView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loginview extends StatefulWidget {
  const Loginview({Key? key}) : super(key: key);

  @override
  _LoginviewState createState() => _LoginviewState();
}

class _LoginviewState extends State<Loginview> {
  bool isLoading = false;
  @override
  void initState() {
    super.initState();
    checkUSerState();
  }

  checkUSerState() async {
    bool c = await LoginUserDataPrefs.checkIfLoggedIn() ?? false;
    if (c) {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => Homeview()),
          (route) => false);
    }
  }

  UserDataFirebaseServices userDataFirebaseServices =
      UserDataFirebaseServices();
  bool showPassword = true;
  final GlobalKey _formKey = GlobalKey();
  TextEditingController usernamecont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: <Color>[
                  My_Colors.backgroundScaffoldColor.withOpacity(0.9),
                  My_Colors.backgroundScaffoldColor
                ])),
          ),
          Center(
              child: Container(
            height: s.height * 0.6,
            width: s.width * 0.8,
            decoration: BoxDecoration(
                color: My_Colors.backgroundScaffoldColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 40, bottom: 15, left: 10, right: 10),
                child: isLoading
                    ? SpinKitPulse(
                        size: 300,
                        color: My_Colors.primarybuttonColor,
                      )
                    : Form(
                        key: _formKey,
                        child: Column(
                          children: [
                            Text(
                              "Login",
                              style: TextStyle(
                                  color: My_Colors.textColor, fontSize: 26),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                          topLeft: Radius.circular(16),
                                          topRight: Radius.circular(16))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: usernamecont,
                                      validator: (v) {
                                        if (v!.length < 5) {
                                          return "username is too small";
                                        }
                                        if (v.isEmpty || v == "") {
                                          return "username can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          hintText: " Username",
                                          hintStyle:
                                              TextStyle(color: Colors.white24),
                                          fillColor: Colors.white),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(16),
                                          bottomRight: Radius.circular(16),
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: passwordcont,
                                      validator: (v) {
                                        if (v!.length < 8) {
                                          return "password is too small";
                                        }
                                        if (v.isEmpty || v == "") {
                                          return "password can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      obscureText: showPassword,
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          suffixIcon: GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  showPassword = !showPassword;
                                                });
                                              },
                                              child: Icon(
                                                showPassword
                                                    ? Icons
                                                        .remove_red_eye_outlined
                                                    : Icons.hide_source,
                                                color: showPassword
                                                    ? Colors.green
                                                    : Colors.red,
                                              )),
                                          hintText: " Password",
                                          hintStyle:
                                              TextStyle(color: Colors.white24),
                                          fillColor: Colors.white),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Does't have account? ",
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontWeight: FontWeight.w300),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Signupview()));
                                  },
                                  child: Text("Sign Up",
                                      style: TextStyle(
                                          color: Colors.blue,
                                          fontStyle: FontStyle.italic)),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                Signupview()));
                                  },
                                  child: Text("Forgot Password?",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontStyle: FontStyle.italic)),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
              ),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () async {
                  setState(() {
                    isLoading = true;
                  });
                  int userdata;
                  userdata = await userDataFirebaseServices.loginUser(
                      usernamecont.text, passwordcont.text);
                  setState(() {
                    isLoading = false;
                  });
                  if (userdata == 200) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text(
                        "Logged In Successfuly!",
                        style:
                            TextStyle(color: My_Colors.backgroundScaffoldColor),
                      ),
                      backgroundColor: Colors.green,
                      duration: Duration(seconds: 1),
                    ));
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(builder: (context) => Homeview()),
                        (route) => false);
                  } else if (userdata == 300) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text(
                        "In-correct Password!",
                        style:
                            TextStyle(color: My_Colors.backgroundScaffoldColor),
                      ),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 1),
                    ));
                  } else if (userdata == 400) {
                    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
                      content: Text(
                        "Kindly Register Yourself!",
                        style:
                            TextStyle(color: My_Colors.backgroundScaffoldColor),
                      ),
                      backgroundColor: Colors.redAccent,
                      duration: Duration(seconds: 1),
                    ));
                  }
                },
                child: Container(
                  height: 50,
                  width: s.width * 0.3,
                  child: Center(
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: My_Colors.backgroundScaffoldColor),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: My_Colors.primarybuttonColor,
                      borderRadius: BorderRadius.circular(24)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
