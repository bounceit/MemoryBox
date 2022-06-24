import 'package:flutter/material.dart';
import '../pages/auth_pages/main_register_page.dart';
import '../pages/main_pages/all_audio.dart';
import '../pages/main_pages/collections.dart';
import '../pages/main_pages/profile.dart';
import '../pages/main_pages/main_of_main.dart';
import '../pages/main_pages/voice_page.dart';
import '../pages/main_pages/home_page.dart';

class AppRouter {
  const AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    WidgetBuilder builder;

    switch (settings.name) {
      case CollectionsPage.routeName:
        builder = (_) => CollectionsPage.create();
        break;

      case MainPageWidget.routeName:
        builder = (_) => MainPageWidget.create();
        break;

      case SellectionsPage.routeName:
        builder = (_) => SellectionsPage.create();
        break;

      // /first_page.dart
      case ProfilePage.routeName:
        builder = (_) => ProfilePage.create();
        break;

      // /first_wight_page.dart
      case VoisePage.routeName:
        builder = (_) => const VoisePage();
        break;

      case MainRegisterPage.routeName:
        builder = (_) => MainRegisterPage.create();
        break;

      // case MainPage.routeName:
      //   builder = (_) => MainPage();
      //   break;
      case Main.routeName:
        builder = (_) => Main.create();
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
