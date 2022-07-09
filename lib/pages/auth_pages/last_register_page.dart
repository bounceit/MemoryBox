import 'dart:async';

import 'package:audio_fairy_tales/pages/auth_pages/regular_user_page.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/recursec/app_icons.dart';

import 'package:flutter/material.dart';

import '../../repositories/user_repositories.dart';
import '../../widgets/uncategorized/main_clip_path.dart';
import '../../widgets/uncategorized/main_register_clip_path.dart';
import '../main_pages/main_of_main.dart';

class LastPageRegister extends StatefulWidget {
  static const routeName = '/last_register_page';
  LastPageRegister({Key? key}) : super(key: key);

  @override
  State<LastPageRegister> createState() => _LastPageRegisterState();
}

class _LastPageRegisterState extends State<LastPageRegister> {
  final UserRepositories rep = UserRepositories();

  void initState() {
    _setInitialData();
    super.initState();
  }

  void _setInitialData() {
    rep.saveUserAuth();
    Timer(Duration(milliseconds: 5000), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Main.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        RegisterClipPath(),
        SizedBox(height: 50),
        InitialBoxWidget(),
        SizedBox(height: 40),
        Image.asset(AppIcons.heart),
      ],
    ));
  }
}
