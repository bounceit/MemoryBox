import 'package:audio_fairy_tales/pages/drawer_pages/search_page/search_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/subscription_page.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/support_page/support_page.dart';
import 'package:audio_fairy_tales/pages/home_pages/home_page.dart';
import 'package:audio_fairy_tales/pages/main_pages/profile_pages/profile_page/profile.dart';
import 'package:audio_fairy_tales/pages/voise_pages/voice_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/bloc_navigations/navigation_bloc.dart';
import '../blocs/bloc_navigations/navigation_event.dart';
import '../blocs/bloc_navigations/navigation_state.dart';
import '../routes/routes.dart';
import '../widgets/navigation/bottom_navigation_bar.dart';
import '../widgets/navigation/driwer_bar.dart';
import 'auth_pages/last_auth_page.dart';

import 'auth_pages/registration_pages/registration_page.dart';
import 'drawer_pages/audio_delete_pages/audio_delete_page.dart';

import 'main_pages/all_audio_pages/sellections_page.dart';
import 'main_pages/collections_pages/collections/collections.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);
  static const routeName = '/main';

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  static const List<String> _pages = [
    HomePage.routeName,
    Collections.routeName,
    RecordPage.routeName,
    SellectionsPage.routeName,
    Profile.routeName,
    SearchPage.routeName,
    DeletePage.routeName,
    SupportMessagePage.routeName,
    SubscriptionPage.routeName,
    RegistrationPage.routeName,
    LastAuthorizationPage.routeName,
  ];

  static final GlobalKey<NavigatorState> _navigatorKey =
      GlobalKey<NavigatorState>();
  void _onSelectMenu(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (_) => false,
      );
    }
  }

  void _onSelectTab(String route) {
    if (_navigatorKey.currentState != null) {
      _navigatorKey.currentState!.pushNamedAndRemoveUntil(
        route,
        (route) => false,
      );
    }
  }

  Future<bool> _onWillPop() async {
    final bool maybePop = await _navigatorKey.currentState!.maybePop();

    return !maybePop;
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NavigationBloc>(
          create: (_) => NavigationBloc(),
        ),
      ],
      child: BlocConsumer<NavigationBloc, NavigationState>(
        listener: (_, state) {
          if (state.status == NavigationStateStatus.menu) {
            _onSelectMenu(state.route);
          }

          if (state.status == NavigationStateStatus.tab) {
            _onSelectTab(state.route);
          }
        },
        builder: (context, state) {
          return WillPopScope(
            onWillPop: _onWillPop,
            child: Scaffold(
              body: Navigator(
                key: _navigatorKey,
                initialRoute: HomePage.routeName,
                onGenerateRoute: AppRouter.generateRoute,
              ),
              drawerEnableOpenDragGesture: true,
              drawer: const DrawerMenu(),
              bottomNavigationBar: BottomNavBar(
                currentTab: state.currentIndex,
                onSelect: (int index) {
                  if (state.currentIndex != index) {
                    context.read<NavigationBloc>().add(
                          NavigateTab(
                            tabIndex: index,
                            route: _pages[index],
                          ),
                        );
                  }
                },
              ),
            ),
          );
        },
      ),
    );
  }
}
