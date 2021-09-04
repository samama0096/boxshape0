import 'package:boxshape/Firebase/services/users.firebase.dart';
import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:boxshape/UI/views/loginview.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ConfirmContactview extends StatefulWidget {
  ConfirmContactview(
      {Key? key,
      required this.fullname,
      required this.username,
      required this.email,
      required this.contact,
      required this.password,
      required this.verfID})
      : super(key: key);
  final verfID;
  final fullname;
  final username;
  final email;
  final contact;
  final password;
  @override
  _ConfirmContactview createState() => _ConfirmContactview();
}

class _ConfirmContactview extends State<ConfirmContactview> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController otpcont = TextEditingController();
  UserDataFirebaseServices userDataFirebaseServices =
      UserDataFirebaseServices();
  bool isLoading = false;
  FirebaseAuth _auth = FirebaseAuth.instance;

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
                                "Confirm Contact Number",
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
                                      controller: otpcont,
                                      validator: (v) {
                                        if (v!.isEmpty || v == "") {
                                          return "This field can't be empty";
                                        } else {
                                          return null;
                                        }
                                      },
                                      style: TextStyle(color: Colors.white70),
                                      decoration: InputDecoration(
                                          hintText:
                                              " Enter the otp you recieved!",
                                          hintStyle:
                                              TextStyle(color: Colors.white24),
                                          fillColor: Colors.white),
                                    ),
                                  ))),
                            ),
                            SizedBox(
                              height: 4,
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
                    final phoneCredt = PhoneAuthProvider.credential(
                        verificationId: widget.verfID, smsCode: otpcont.text);
                    final _auth_res =
                        await _auth.signInWithCredential(phoneCredt);
                    print('Token: ${phoneCredt.token}');
                    if (_auth_res.user != null) {
                      print("token verified!");
                      await userDataFirebaseServices.createNewUserInDataBase(
                          fullname: widget.fullname,
                          username: widget.username,
                          password: widget.password,
                          contact: widget.contact,
                          email: widget.email);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.green,
                          content: Text("Registered Successfuly!")));
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(builder: (context) => Loginview()),
                          (route) => false);
                    } else if (phoneCredt.token == null) {
                      setState(() {
                        isLoading = false;
                      });
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.red,
                          content: Text("Registeration Failed!")));
                    }
                  }
                },
                child: Container(
                  height: 50,
                  width: s.width * 0.4,
                  child: Center(
                    child: Text(
                      "Verify!",
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
