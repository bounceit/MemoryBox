import 'dart:async';

import 'package:flutter/material.dart';

import '../anim/screen_saver/screen_saver.dart';

class FirstWightPage extends StatefulWidget {
  const FirstWightPage({Key? key}) : super(key: key);
  static const routeName = '/logo_page';

  @override
  FirstWightPageState createState() => FirstWightPageState();
}

class FirstWightPageState extends State<FirstWightPage> {
  @override
  void initState() {
    Timer(const Duration(seconds: 1), () {
      Navigator.pushNamed(
        context,
        Screensaver.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Color(0xFF8077E4),
      ),
    );
  }
}
