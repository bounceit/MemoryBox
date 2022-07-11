import 'package:flutter/material.dart';

import '../../../repositories/user_repositories.dart';
import '../main_register_page.dart';
import '../regular_user_page.dart';

class InitializerWidget extends StatelessWidget {
  InitializerWidget({Key? key}) : super(key: key);
  static const routeName = '/initializer_widget';
  final UserRepositories rep = UserRepositories();
  final isLoading = false;
  static Widget create() {
    return InitializerWidget();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : rep.user == null
            ? const MainRegisterPage()
            : const RegularUserSplash();
  }
}
