import 'dart:async';

import 'package:audio_fairy_tales/pages/auth_pages/regular_user_page.dart';
import 'package:audio_fairy_tales/recursec/app_icons.dart';
import 'package:flutter/material.dart';
import '../../repositories/user_repositories.dart';
import '../../widgets/uncategorized/main_register_clip_path.dart';
import '../main_pages/main_of_main.dart';

class LastPageRegister extends StatefulWidget {
  LastPageRegister({Key? key}) : super(key: key);
  static const routeName = '/last_register_page';

  @override
  State<LastPageRegister> createState() => _LastPageRegisterState();
}

class _LastPageRegisterState extends State<LastPageRegister> {
  final UserRepositories rep = UserRepositories();
  @override
  void initState() {
    rep.readUser();
    rep.firstAuthorization();
    _setInitialData();
    super.initState();
  }

  void _setInitialData() {
    Timer(const Duration(milliseconds: 5000), () {
      Navigator.of(context)
          .pushNamedAndRemoveUntil(Main.routeName, (route) => false);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        const RegisterClipPath(),
        const SizedBox(height: 50),
        const InitialBoxWidget(),
        const SizedBox(height: 40),
        Image.asset(AppIcons.heart),
      ],
    ));
  }
}
