import 'dart:async';

import 'package:flutter/material.dart';

import '../../recursec/app_icons.dart';
import '../../utils/constants.dart';
import '../../widgets/container_shadow.dart';
import '../../widgets/uncategorized/app_bar_auth.dart';
import '../main_pages/main_of_main.dart';

class FirstAuthorizationPage extends StatefulWidget {
  const FirstAuthorizationPage({Key? key}) : super(key: key);
  static const routeName = '/first_authorization_page';

  @override
  State<FirstAuthorizationPage> createState() => _FirstAuthorizationPageState();
}

class _FirstAuthorizationPageState extends State<FirstAuthorizationPage> {
  final bool shouldPop = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(
        context,
        MainPage.routeName,
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        body: Column(
          children: [
            const AppbarHeaderAuthorization(
              title: 'MemoryBox',
              subtitle: 'Твой голос всегда рядом',
            ),
            SizedBox(
              height: screenHeight - 300.0,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 50.0),
                child: Column(
                  children: [
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const ContainerShadow(
                      image: Text(''),
                      width: 300.0,
                      height: 80.0,
                      widget: Text(
                        'Мы рады тебя видеть',
                        style: bodyTextStyle,
                      ),
                      radius: 20.0,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    Image.asset(
                      AppIcons.heart,
                    ),
                    const Expanded(
                      child: SizedBox(),
                    ),
                    const ContainerShadow(
                      image: Text(''),
                      width: 250.0,
                      height: 75.0,
                      widget: Text(
                        'Взрослые иногда нуждаются в \n сказке даже больше, чем дети',
                        style: bodyTextStyle,
                      ),
                      radius: 20.0,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
