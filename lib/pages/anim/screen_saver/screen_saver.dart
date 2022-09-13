import 'dart:io';

import 'package:audio_fairy_tales/pages/auth_pages/initializer_widget.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../recursec/app_icons.dart';

class Screensaver extends StatefulWidget {
  const Screensaver({Key? key}) : super(key: key);
  static const routeName = 'screensaver_page';

  @override
  ScreensaverState createState() => ScreensaverState();
}

class ScreensaverState extends State<Screensaver>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late AnimationController controller2;
  late Animation animation;
  late Animation animationColor;
  late Animation animationColor2;
  late Animation animationColor3;
  bool shouldPop = false;
  @override
  void initState() {
    super.initState();
    anim();
  }

  void anim() {
    controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    controller2 = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    animation = CurvedAnimation(
      parent: controller,
      curve: Curves.decelerate,
    );
    animationColor = ColorTween(
      begin: Colors.white,
      end: AppColors.colorAppbar,
    ).animate(controller);
    animationColor2 = ColorTween(
      begin: const Color(0XFF8077E4),
      end: AppColors.white100,
    ).animate(controller);
    animationColor3 = ColorTween(
      begin: const Color(0XFF8077E4),
      end: const Color(0xFFF1B488),
    ).animate(controller2);
    controller2.forward();
    controller2.addListener(() {});
    animationColor3.addStatusListener((status) {
      if (status == AnimationStatus.completed) {}
    });

    controller.forward();
    controller.addListener(() {
      setState(() {});
    });

    controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        const duration = Duration(seconds: 2);
        sleep(duration);
        Navigator.pushNamed(
          context,
          InitializerWidget.routeName,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return shouldPop;
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                animationColor3.value,
                const Color(0xFF8077E4),
              ],
              begin: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 60.0,
                width: 250.0,
                decoration: BoxDecoration(
                  color: animationColor.value,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(50.0),
                  ),
                ),
                child: Center(
                  child: Text(
                    'MemoryBox',
                    style: TextStyle(
                      color: animationColor2.value,
                      fontSize: controller.value * 42,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Image.asset(
                  AppIcons.microfon,
                  width: 100.0,
                  height: 100.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
