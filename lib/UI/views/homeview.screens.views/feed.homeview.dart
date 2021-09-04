import 'package:boxshape/UI/components/ui.colors.dart';
import 'package:flutter/material.dart';

class Feedview extends StatefulWidget {
  Feedview({Key? key}) : super(key: key);

  @override
  _FeedviewState createState() => _FeedviewState();
}

class _FeedviewState extends State<Feedview>
    with SingleTickerProviderStateMixin {
  TabController? _tabCont;
  @override
  void initState() {
    super.initState();
    _tabCont = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: My_Colors.backgroundScaffoldColor,
      body: SafeArea(
        child: Center(
          child: Container(
            height: s.height * 0.95,
            width: s.width * 0.95,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [],
            ),
          ),
        ),
      ),
    );
  }

  List<String> images = [
    "lib/assets/homeassets/new.jpg",
    "lib/assets/homeassets/offseason.jpg"
        "lib/assets/homeassets/discount.jpg"
  ];
}
