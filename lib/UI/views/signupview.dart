import 'package:boxshape/Firebase/services/users.firebase.dart';
import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:boxshape/UI/views/otp/confirm.contact.otp.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Signupview extends StatefulWidget {
  Signupview({Key? key}) : super(key: key);

  @override
  _SignupviewState createState() => _SignupviewState();
}

class _SignupviewState extends State<Signupview> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController fullnamecont = TextEditingController();
  TextEditingController usernamecont = TextEditingController();
  TextEditingController emailcont = TextEditingController();
  TextEditingController passwordcont = TextEditingController();
  TextEditingController contactcont = TextEditingController();
  var verf_ID;
  FirebaseAuth _auth = FirebaseAuth.instance;
  UserDataFirebaseServices userDataFirebaseServices =
      UserDataFirebaseServices();
  bool showPassword = true;
  bool isLoading = false;

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
            height: s.height * 0.9,
            width: s.width * 0.85,
            decoration: BoxDecoration(
                color: My_Colors.backgroundScaffoldColor.withOpacity(0.3),
                borderRadius: BorderRadius.circular(25)),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 15, left: 10, right: 10),
                child: isLoading
                    ? SpinKitPouringHourGlass(color: Colors.greenAccent)
                    : Form(
                        key: _formKey,
                        child: ListView(
                          children: [
                            Center(
                              child: Text(
                                "Sign Up",
                                style: TextStyle(
                                    color: My_Colors.textColor, fontSize: 26),
                              ),
                            ),
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
                                        if (v!.isEmpty || v == "") {
                                          return "Username can't be empty";
                                        }
                                        if (v.length < 5) {
                                          return "Username is too small";
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
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: fullnamecont,
                                      validator: (v) {
                                        if (v!.length < 5) {
                                          return "The name you provided is too small";
                                        }
                                        if (v.isEmpty || v == "") {
                                          return "Name can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          hintText: " Full Name",
                                          hintStyle:
                                              TextStyle(color: Colors.white24),
                                          fillColor: Colors.white),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: emailcont,
                                      validator: (v) {
                                        bool b = EmailValidator.validate(v!);
                                        return b
                                            ? null
                                            : "Please enter a valid email";
                                      },
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          hintText: " Email",
                                          hintStyle:
                                              TextStyle(color: Colors.white24),
                                          fillColor: Colors.white),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(4),
                                          bottomRight: Radius.circular(4),
                                          topLeft: Radius.circular(4),
                                          topRight: Radius.circular(4))),
                                  child: Center(
                                      child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: TextFormField(
                                      controller: contactcont,
                                      validator: (v) {
                                        if (v!.length < 9) {
                                          return "Contact number not valid";
                                        }
                                        if (v.isEmpty || v == "") {
                                          return "Contact can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          hintText: " Contact",
                                          hintStyle:
                                              TextStyle(color: Colors.white24),
                                          fillColor: Colors.white),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 4,
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
                                        if (v!.isEmpty || v == "") {
                                          return "Password can't be empty";
                                        }
                                        if (v.length < 8) {
                                          return "Password is too small";
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
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text("Back",
                                      style: TextStyle(
                                        color: Colors.blue,
                                      )),
                                ),
                              ],
                            ),
                          ],
                        )),
              ),
            ),
          )),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: GestureDetector(
                onTap: () async {
                  if (_formKey.currentState!.validate()) {
                    setState(() {
                      isLoading = true;
                    });
                    int statusCode = await userDataFirebaseServices
                        .checkIfUsernamePresent(usernamecont.text);
                    if (statusCode == 200) {
                      await _auth.verifyPhoneNumber(
                          phoneNumber: contactcont.text,
                          verificationCompleted: (v) {
                            setState(() {
                              isLoading = false;
                            });
                          },
                          verificationFailed: (v) {
                            setState(() {
                              isLoading = false;
                            });
                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                backgroundColor: Colors.red,
                                content: Text(
                                  "Error sending code!",
                                  style: TextStyle(color: Colors.white),
                                )));
                          },
                          codeSent: (vID, resToken) {
                            setState(() {
                              isLoading = false;
                              verf_ID = vID;
                            });
                            print("OK");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ConfirmContactview(
                                          verfID: verf_ID,
                                          fullname: fullnamecont.text,
                                          email: emailcont.text,
                                          password: passwordcont.text,
                                          contact: contactcont.text,
                                          username: usernamecont.text,
                                        )));
                          },
                          codeAutoRetrievalTimeout: (v) {});
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text("Username already taken"),
                        duration: Duration(seconds: 1),
                      ));
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: s.width * 0.4,
                  child: Center(
                    child: Text(
                      "Register!",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                          color: My_Colors.backgroundScaffoldColor),
                    ),
                  ),
                  decoration: BoxDecoration(
                      color: Colors.green,
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
