import 'package:audio_fairy_tales/pages/drawer_pages/subscriptions_page/widgets/appbar_subscriptions.dart';
import 'package:flutter/material.dart';

import '../../../recursec/app_colors.dart';
import '../../../utils/constants.dart';

class SubscriptionPage extends StatelessWidget {
  const SubscriptionPage({Key? key}) : super(key: key);
  static const routeName = '/subscription_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.colorAppbar,
        leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(Icons.menu),
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
                      style: twoTitleTextStyle,
                    ),
                  ],
                ),
                // SubscriptionAuthorisation()
              ],
            ),
          ],
        ),
      ),
    );
  }
}
