import 'dart:async';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/recursec/app_icons.dart';
import 'package:flutter/material.dart';

import '../../repositories/user_repositories.dart';
import '../../utils/constants.dart';
import '../auth_pages/widgets/initial_widget.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({Key? key}) : super(key: key);
  static const routeName = '/splash_page';
  final UserRepositories rep = UserRepositories();

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    _setInitialData();
    super.initState();
  }

  void _setInitialData() {
    Timer(const Duration(milliseconds: 5000), () {
      _navigateToPage(InitializerWidget.routeName);
    });
  }

  void _navigateToPage(String route) {
    Navigator.of(context, rootNavigator: true).pushNamedAndRemoveUntil(
      route,
      (_) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.violet,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'MemoryBox',
                style: twoTitleTextStyle,
              ),
              Image.asset(AppIcons.microfon),
            ],
          ),
        ),
      ),
    );
  }
}
