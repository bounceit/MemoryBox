import 'dart:async';

import 'package:audio_fairy_tales/pages/home_pages/appbar_home.dart';
import 'package:audio_fairy_tales/pages/home_pages/home_page_audio.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../blocs/list_item_block/list_item_block.dart';
import '../../repositories/audio_firebase_repositories.dart';
import '../../repositories/auth_repository.dart';
import '../../repositories/user_repositories.dart';
import '../drawer_pages/subscriptions_page/subscription_page.dart';
import 'bloc/blue_bloc/blue_bloc.dart';
import 'bloc/green_bloc/green_bloc.dart';
import 'bloc/orange_bloc/orange_bloc.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<void> subscriptionDone(BuildContext context) async {
    if (AuthRepositories.instance.user != null) {
      await FirebaseFirestore.instance
          .collection(AuthRepositories.instance.user!.phoneNumber!)
          .get()
          .then(
        (querySnapshot) {
          for (var result in querySnapshot.docs) {
            final bool subscription = result.data()['subscription'] ?? true;
            if (subscription == false) {
              Timer(const Duration(seconds: 3), () {
                Navigator.pushNamed(
                  context,
                  SubscriptionPage.routeName,
                );
              });
            }
          }
        },
      );
    }
  }

  @override
  void initState() {
    UserRepositories.instance.limitNotSubscription();
    subscriptionDone(context);
    AudioRepositories.instance.finishDelete();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ListItemBloc>(
          create: (context) => ListItemBloc()
            ..add(
              LoadListItemEvent(
                sort: 'all',
                collection: 'Collections',
                nameSort: 'collections',
              ),
            ),
        ),
        BlocProvider<GreenListItemBloc>(
          create: (context) => GreenListItemBloc()
            ..add(
              LoadGreenListItemEvent(),
            ),
        ),
        BlocProvider<OrangeListItemBloc>(
          create: (context) => OrangeListItemBloc()
            ..add(
              LoadOrangeListItemEvent(),
            ),
        ),
        BlocProvider<BlueListItemBloc>(
          create: (context) => BlueListItemBloc()
            ..add(
              const LoadBlueListItemEvent(),
            ),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
            icon: const Icon(Icons.menu),
          ),
          elevation: 0.0,
        ),
        body: SizedBox(
          height: screenHeight - (kBottomNavigationBarHeight + 40.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Expanded(
                flex: 8,
                child: AppbarHeaderHomePage(),
              ),
              Expanded(
                flex: 9,
                child: HomePageAudio(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
