import 'dart:async';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/recursec/app_icons.dart';
import 'package:flutter/material.dart';
import '../../utils/constants.dart';
import '../../widgets/uncategorized/register_clip_path.dart';
import '../main_pages/main_of_main.dart';

class RegularUserSplash extends StatefulWidget {
  const RegularUserSplash({Key? key}) : super(key: key);
  static const routeName = '/regular_user_page';

  @override
  State<RegularUserSplash> createState() => _RegularUserSplashState();
}

class _RegularUserSplashState extends State<RegularUserSplash> {
  final bool shouldPop = false;

  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Navigator.pushNamed(context, Main.routeName);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
          backgroundColor: AppColors.white100,
          body: Column(
            children: [
              ClipPathWidget(),
              SizedBox(height: 40),
              InitialBoxWidget(),
              SizedBox(height: 30),
              Image.asset(AppIcons.heart),
              SizedBox(height: 80),
              Container(
                child: Text(
                  'Взрослые иногда уждаются в \n сказке больше, чем дети',
                  style: sevenTitleTextStyle.copyWith(
                    color: AppColors.colorText80,
                  ),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 35,
                  vertical: 20,
                ),
                decoration: BoxDecoration(
                  color: AppColors.white100,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset.fromDirection(1),
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 1,
                      blurRadius: 5,
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

class InitialBoxWidget extends StatelessWidget {
  const InitialBoxWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        'Мы рады тебя видеть',
        style: bodyTextStyle,
      ),
      padding: const EdgeInsets.symmetric(
        horizontal: 30,
        vertical: 20,
      ),
      decoration: BoxDecoration(
        color: AppColors.white100,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(1),
            color: Colors.grey.withOpacity(0.4),
            spreadRadius: 1,
            blurRadius: 5,
          ),
        ],
      ),
    );
  }
}
