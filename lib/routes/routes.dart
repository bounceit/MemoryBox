import 'package:audio_fairy_tales/pages/auth_pages/last_register_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/search_page/search_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/subscription_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/support_page/support_page.dart';
import 'package:flutter/material.dart';

import '../pages/auth_pages/main_register_page.dart';
import '../pages/auth_pages/register_page.dart';
import '../pages/auth_pages/widgets/initial_widget.dart';
import '../pages/drawer_pages/audio_delete_pages/audio_delete_page.dart';
import '../pages/home_pages/home_page.dart';
import '../pages/main_pages/all_audio.dart';
import '../pages/main_pages/collections_pages/collections.dart';
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
      case Collections.routeName:
        builder = (_) => Collections.create();
        break;

      case HomePage.routeName:
        builder = (_) => const HomePage();
        break;

      case SellectionsPage.routeName:
        builder = (_) => SellectionsPage.create();
        break;

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

      case SubscriptionPage.routeName:
        builder = (_) => const SubscriptionPage();
        break;

      case LastPageRegister.routeName:
        builder = (_) => const LastPageRegister();
        break;

      case InitializerWidget.routeName:
        builder = (_) => InitializerWidget();
        break;

      case DeletePage.routeName:
        builder = (_) => DeletePage.create();
        break;

      case SupportMessagePage.routeName:
        builder = (_) => SupportMessagePage();
        break;

      case SearchPage.routeName:
        builder = (_) => const SearchPage();
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
