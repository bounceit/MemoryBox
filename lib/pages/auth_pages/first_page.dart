import 'package:audio_fairy_tales/pages/auth_pages/registration_pages/registration_page.dart';
import 'package:flutter/material.dart';

import '../../widgets/buttons/button_continue.dart';
import '../../widgets/uncategorized/app_bar_auth.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);
  final bool shouldPop = false;
  static const routeName = '/';

  @override
  Widget build(BuildContext context) {
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
            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(
                    bottom: 100.0,
                  ),
                  child: SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Привет!',
                          style: TextStyle(
                            fontSize: 24.0,
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 55.0,
                          ),
                          child: Text(
                            'Мы рады видеть тебя здесь. Это приложение поможет записывать сказки и держать их в удобном месте не заполняя память на телефоне.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 30.0,
                        ),
                        ButtonContinue(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              RegistrationPage.routeName,
                            );
                          },
                          text: 'Продолжыть',
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
