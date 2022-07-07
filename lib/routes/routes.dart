import 'package:audio_fairy_tales/pages/auth_pages/last_register_page.dart';
import 'package:flutter/material.dart';
import '../pages/auth_pages/main_register_page.dart';
import '../pages/auth_pages/register_page.dart';
import '../pages/auth_pages/widgets/initial_widget.dart';
import '../pages/main_pages/all_audio.dart';
import '../pages/main_pages/collections.dart';
import '../pages/main_pages/profile.dart';
import '../pages/main_pages/main_of_main.dart';
import '../pages/voise_pages/voice_page.dart';
import '../pages/main_pages/home_page.dart';
import '../pages/uncategorized/splash_screen.dart';
import '../pages/voise_pages/model_voise_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case CollectionsPage.routeName:
        builder = (_) => CollectionsPage();
        break;

      case MainPageWidget.routeName:
        builder = (_) => MainPageWidget();
        break;

      case SellectionsPage.routeName:
        builder = (_) => SellectionsPage();
        break;

      // /first_page.dart
      case ProfilePage.routeName:
        builder = (_) => ProfilePage();
        break;

      // /first_wight_page.dart
      case VoisePage.routeName:
        builder = (_) => const VoisePage();
        break;

      case MainRegisterPage.routeName:
        builder = (_) => MainRegisterPage();
        break;

      case RegisterPage.routeName:
        builder = (_) => RegisterPage();
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
