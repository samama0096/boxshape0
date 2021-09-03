import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:flutter/material.dart';

class Feedview extends StatefulWidget {
  Feedview({Key? key}) : super(key: key);

  @override
  _FeedviewState createState() => _FeedviewState();
}

class _FeedviewState extends State<Feedview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: My_Colors.backgroundScaffoldColor,
      body: Center(
        child: Text("Feed"),
      ),
    );
  }
}
