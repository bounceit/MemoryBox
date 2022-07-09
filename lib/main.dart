import 'package:audio_fairy_tales/pages/main_page.dart';
import 'package:audio_fairy_tales/pages/register_page.dart';
import 'package:flutter/material.dart';
import 'pages/main_register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/auth': (context) => const MainRegisterPage(),
        '/register_page': (context) => const RegisterPage(),
        '/main_page': (context) => const MainPage(),
      },
      initialRoute: '/auth',
    );
  }
}
