import 'dart:async';

import 'package:audio_fairy_tales/pages/auth_pages/regular_user_page.dart';
import 'package:audio_fairy_tales/recursec/app_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import '../../repositories/user_repositories.dart';
import '../../utils/constants.dart';
import '../../widgets/container_shadow.dart';
import '../../widgets/uncategorized/app_bar_auth.dart';
import '../../widgets/uncategorized/main_register_clip_path.dart';
import '../main_pages/main_of_main.dart';

class LastPageRegister extends StatefulWidget {
  const LastPageRegister({Key? key}) : super(key: key);
  static const routeName = '/last_authorization_page';

  @override
  State<LastPageRegister> createState() => _LastAuthorizationPageState();
}

class _LastAuthorizationPageState extends State<LastPageRegister> {
  final bool shouldPop = false;
  @override
  void initState() {
    Timer(const Duration(seconds: 5), () {
      Phoenix.rebirth(context);
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              const AppbarHeaderAuthorization(
                title: 'Ты супер!',
                subtitle: '',
              ),
              const SizedBox(
                height: 40.0,
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
              const SizedBox(
                height: 50.0,
              ),
              Image.asset(
                AppIcons.heart,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
