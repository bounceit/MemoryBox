import 'package:audio_fairy_tales/pages/auth_pages/first_wight_page.dart';

import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:audio_fairy_tales/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
  await Firebase.initializeApp();
  runApp(
    Phoenix(
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MemoryBox',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.colorAppbar,
        ),
        textTheme: const TextTheme(
          bodyText2: TextStyle(
            color: AppColors.colorText,
            fontFamily: 'TTNorms',
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
      initialRoute: FirstWightPage.routeName,
      onGenerateRoute: AppRouter.generateRoute,
    );
  }
}
