import 'dart:async';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/utils/constants.dart';
import 'package:flutter/material.dart';

import '../../repositories/user_repositories.dart';
import '../main_pages/main_of_main.dart';

class LastPageRegister extends StatefulWidget {
  static const routeName = '/last_register_page';
  LastPageRegister({Key? key}) : super(key: key);
  final UserRepositories rep = UserRepositories();

  @override
  State<LastPageRegister> createState() => _LastPageRegisterState();
}

class _LastPageRegisterState extends State<LastPageRegister> {
  void initState() {
    _setInitialData();
    super.initState();
  }

  void _setInitialData() {
    Timer(Duration(milliseconds: 5000), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Main.routeName, (route) => false);
    });
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
              Text(
                'LastRegisterPage',
                style: twoTitleTextStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
