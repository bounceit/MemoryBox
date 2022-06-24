import 'package:audio_fairy_tales/pages/auth_pages/register_page.dart';
import 'package:audio_fairy_tales/pages/main_pages/main_of_main.dart';
import 'package:audio_fairy_tales/pages/main_pages/voice_page.dart';
import 'package:audio_fairy_tales/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/view_model.dart';
import 'pages/auth_pages/main_register_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<Navigation>(
      create: (BuildContext context) => Navigation(),
      child: MaterialApp(
        initialRoute: Main.routeName,
        onGenerateRoute: AppRouter.generateRoute,
        routes: {
          Main.routeName: (_) => const Main(),
        },
      ),
    );
  }
}
