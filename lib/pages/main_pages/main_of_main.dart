import 'package:audio_fairy_tales/pages/main_pages/home_page.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile.dart';
import 'package:audio_fairy_tales/pages/voise_pages/voice_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/view_model.dart';
import '../../routes/routes.dart';
import '../../widgets/navigation/bottom_navigation_bar.dart';
import '../../widgets/navigation/driwer_bar.dart';
import 'all_audio.dart';
import 'collections_pages/collections.dart';

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);
  static const routeName = '/main';
  static final GlobalKey<NavigatorState> _globalKey =
      GlobalKey<NavigatorState>();
  final bool? shouldPop = false;

  static Widget create() {
    return ChangeNotifierProvider(
      create: (_) => Navigation(),
      child: const Main(),
    );
  }

  void globalKey(route) {
    _globalKey.currentState?.pushReplacementNamed(route);
  }

  @override
  Widget build(BuildContext context) {
    final int currentIndex = context.select((Navigation nc) => nc.currentIndex);

    switch (currentIndex) {
      case 0:
        globalKey(MainPageWidget.routeName);

        break;
      case 1:
        globalKey(Collections.routeName);

        break;
      case 2:
        globalKey(VoisePage.routeName);

        break;
      case 3:
        globalKey(SellectionsPage.routeName);

        break;
      case 4:
        globalKey(Profile.routeName);
        break;

      default:
        globalKey(MainPageWidget.routeName);
        break;
    }

    return WillPopScope(
      onWillPop: () async {
        return shouldPop!;
      },
      child: Scaffold(
        drawer: const DrawerMenu(),
        extendBody: true,
        body: Navigator(
          initialRoute: MainPageWidget.routeName,
          key: _globalKey,
          onGenerateRoute: AppRouter.generateRoute,
        ),
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
