import 'package:audio_fairy_tales/pages/auth_pages/last_register_page.dart';
import 'package:flutter/material.dart';

import '../pages/auth_pages/main_register_page.dart';
import '../pages/auth_pages/register_page.dart';
import '../pages/auth_pages/widgets/initial_widget.dart';
import '../pages/main_pages/all_audio.dart';
import '../pages/main_pages/collections.dart';
import '../pages/main_pages/home_page.dart';
import '../pages/main_pages/main_of_main.dart';
import '../pages/main_pages/profile_pages/profile.dart';
import '../pages/uncategorized/splash_screen.dart';
import '../pages/voise_pages/voice_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    final Object? arguments = settings.arguments;
    WidgetBuilder builder;

    switch (settings.name) {
      case CollectionsPage.routeName:
        builder = (_) => const CollectionsPage();
        break;

      case MainPageWidget.routeName:
        builder = (_) => const MainPageWidget();
        break;

      case SellectionsPage.routeName:
        builder = (_) => SellectionsPage.create();
        break;

      // /first_page.dart
      case Profile.routeName:
        builder = (_) => Profile();
        break;

      // /first_wight_page.dart
      case VoisePage.routeName:
        builder = (_) => VoisePage.create();
        break;

      case MainRegisterPage.routeName:
        builder = (_) => const MainRegisterPage();
        break;

      case RegisterPage.routeName:
        builder = (_) => const RegisterPage();
        break;

      case Main.routeName:
        builder = (_) => Main.create();
        break;

      case SplashScreen.routeName:
        builder = (_) => SplashScreen();
        break;

      case LastPageRegister.routeName:
        builder = (_) => LastPageRegister();
        break;

      case InitializerWidget.routeName:
        builder = (_) => InitializerWidget();
        break;

      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
