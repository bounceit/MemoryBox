import 'package:flutter/material.dart';

import '../../../repositories/auth_repository.dart';
import '../../../repositories/user_repositories.dart';
import '../main_register_page.dart';
import '../regular_user_page.dart';

class InitializerWidget extends StatelessWidget {
  const InitializerWidget({Key? key}) : super(key: key);
  static const routeName = '/initializer_widget';
  final isLoading = false;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : AuthRepositories.instance.user == null
            ? const MainRegisterPage()
            : const RegularUserSplash();
  }
}
