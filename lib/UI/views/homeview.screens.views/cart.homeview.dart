import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:flutter/material.dart';

class Cartview extends StatefulWidget {
  Cartview({Key? key}) : super(key: key);

  @override
  _CartviewState createState() => _CartviewState();
}

class _CartviewState extends State<Cartview> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: My_Colors.backgroundScaffoldColor,
      body: Center(
        child: Text("Cart"),
      ),
    );
  }
}
