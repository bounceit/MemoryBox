import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/bloc/subscriptions_page_bloc.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/widgets/appbar_subscriptions.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/widgets/subscription_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../recursec/app_colors.dart';
import '../../../utils/constants.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);
  static const routeName = '/subscription_page';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<SubscriptionPageBloc>(
      create: (context) => SubscriptionPageBloc()
        ..add(
          LoadSubscriptionPageEvent(),
        ),
      child: WillPopScope(
        onWillPop: () async {
          return shouldPop;
        },
        child: Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              icon: const Icon(
                Icons.menu,
              ),
            ),
            title: const Text(
              'Подписка',
              style: twoTitleTextStyle,
            ),
            centerTitle: true,
            elevation: 0.0,
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  children: [
                    const AppbarMenuSubscription(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text(
                          'Расширь возможности',
                          style: threeTitleTextStyle,
                        ),
                      ],
                    ),
                    const SubscriptionAuthorisation()
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
