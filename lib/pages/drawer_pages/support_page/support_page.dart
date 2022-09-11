import 'package:audio_fairy_tales/pages/drawer_pages/support_page/bloc/support_bloc.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/support_page/widgets/appbar_support.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/support_page/widgets/support_message_list.dart';
import 'package:audio_fairy_tales/pages/drawer_pages/support_page/widgets/text_field_support.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../utils/constants.dart';

class SupportMessagePage extends StatelessWidget {
  const SupportMessagePage({Key? key}) : super(key: key);
  static const routeName = '/support_message_page';
  final bool shouldPop = false;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    return BlocProvider<SupportMessageBloc>(
      create: (context) => SupportMessageBloc()
        ..add(
          const LoadSupportMessageEvent(),
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
              'Поддержка',
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
                    const AppbarMenuSupportMessagePage(),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Container(
                        height: screenHeight - 160.0,
                        width: screenWidth * 0.975,
                        decoration: borderContainer2,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            const SupportMessagePageList(),
                            TextFieldSupportMessagePage(),
                          ],
                        ),
                      ),
                    )
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
