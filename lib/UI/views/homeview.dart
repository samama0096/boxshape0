import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:boxshape/UI/views/homeview.screens.views/cart.homeview.dart';
import 'package:boxshape/UI/views/homeview.screens.views/feed.homeview.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:ionicons/ionicons.dart';
import 'package:boxshape/UI/views/homeview.screens.views/profile.homeview.dart';

class Homeview extends StatefulWidget {
  Homeview({Key? key}) : super(key: key);

  @override
  _HomeviewState createState() => _HomeviewState();
}

class _HomeviewState extends State<Homeview> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: My_Colors.backgroundScaffoldColor,
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(60),
                      topRight: Radius.circular(60))),
              child: SafeArea(
                  child: Padding(
                padding: const EdgeInsets.only(
                    top: 1, left: 20, right: 20, bottom: 5),
                child: Container(
                  decoration: BoxDecoration(),
                  child: GNav(
                    gap: 5,
                    activeColor: My_Colors.primarybuttonColor,
                    iconSize: 30,
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    duration: Duration(milliseconds: 400),
                    color: My_Colors.backgroundScaffoldColor,
                    tabs: [
                      GButton(
                        icon: Icons.explore_outlined,
                        text: 'Explore',
                      ),
                      GButton(
                        icon: Ionicons.cart,
                        text: 'Cart',
                      ),
                      GButton(
                        icon: Ionicons.person_circle_outline,
                        text: 'Profile',
                      ),
                    ],
                    selectedIndex: _selectedIndex,
                    onTabChange: (index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                  ),
                ),
              ))),
        ),
        body: _children[_selectedIndex]);
  }

  List<Widget> _children = [Feedview(), Cartview(), Profileview()];
}
