import 'package:boxshape/Helpers/preferences/login.user.prefs.dart';
import 'package:boxshape/UI/views/loginview.dart';
import 'package:boxshape/UI/views/splashview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Loginview(),
  ));
}
