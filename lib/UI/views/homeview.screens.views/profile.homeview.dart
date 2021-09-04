import 'package:boxshape/Firebase/services/users.firebase.dart';
import 'package:boxshape/Helpers/models/userdata.model.dart';
import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:boxshape/UI/views/loginview.dart';
import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';

class Profileview extends StatefulWidget {
  Profileview({Key? key}) : super(key: key);

  @override
  _ProfileviewState createState() => _ProfileviewState();
}

class _ProfileviewState extends State<Profileview> {
  Userdata? savedUserData;
  String? username;
  String? email;
  String? contact;
  String? fullname;
  getSavedUserData() async {
    savedUserData = await LoginUserDataPrefs.getSavedLoginData();

    setState(() {
      username = savedUserData!.username;
      email = savedUserData!.email;
      contact = savedUserData!.contact;
      fullname = savedUserData!.fullname;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSavedUserData();
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: My_Colors.backgroundScaffoldColor,
      body: SafeArea(
        child: Container(
          height: s.height,
          width: s.width,
          child: Container(
            height: s.height,
            width: s.width * 0.9,
            child: ListView(
              children: [
                SizedBox(
                  height: 25,
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                  child: Container(
                    height: s.height * 0.4,
                    width: s.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.5),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(50),
                            bottomRight: Radius.circular(50),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20))),
                    child: Column(
                      children: [
                        Spacer(),
                        CircleAvatar(
                          backgroundColor: My_Colors.backgroundScaffoldColor,
                          child: Center(
                            child: Text(
                              "!",
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.5),
                                  fontSize: 100),
                            ),
                          ),
                          radius: 70,
                        ),
                        Spacer()
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 40, vertical: 25),
                  child: Container(
                    height: s.height * 0.5,
                    width: s.width * 0.7,
                    child: Column(
                      children: [
                        Text(
                          "Personal Information",
                          style: TextStyle(color: Colors.blue),
                        ),
                        card("Username", username ?? "",
                            Ionicons.chevron_forward_sharp),
                        card("Full name  ", fullname ?? "",
                            Ionicons.chevron_forward_sharp),
                        card("Email ", email ?? "", Icons.email_outlined),
                        card("Contact ", contact ?? "",
                            Icons.contact_support_sharp),
                        GestureDetector(
                          onTap: () async {
                            UserDataFirebaseServices serv =
                                UserDataFirebaseServices();
                            await serv
                                .removeLoginStatusOnDatabase(username ?? "");
                            await LoginUserDataPrefs.removeDataFromDevice();
                            Navigator.pushAndRemoveUntil(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => Loginview()),
                                (route) => false);
                          },
                          child: card("Log out", "logout form this account?",
                              Ionicons.log_out_sharp),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  card(String cardname, String value, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.5),
            borderRadius: BorderRadius.circular(25)),
        height: 40,
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Icon(icon),
            ),
            Spacer(),
            Text(
              cardname,
              style: TextStyle(
                  color: My_Colors.backgroundScaffoldColor,
                  fontWeight: FontWeight.w700),
            ),
            Spacer(),
            Text(
              value,
              style: TextStyle(
                  color: My_Colors.backgroundScaffoldColor,
                  fontWeight: FontWeight.w400),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
