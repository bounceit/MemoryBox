import 'package:audio_fairy_tales/pages/main_pages/collections_pages/collections/collections.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../blocs/bloc_navigations/navigation_state.dart';
import '../../../models/view_model.dart';
import '../../navigation/navigate_to_page.dart';

class GreenContainer extends StatelessWidget {
  const GreenContainer({Key? key, required this.screenWidth}) : super(key: key);
  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 2.3,
      height: 210.0,
      decoration: const BoxDecoration(
          color: AppColors.green100,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 10.0,
              right: 10.0,
              top: 25.0,
            ),
            child: Text(
              'Здесь будет твой набор сказок',
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.white,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 40.0),
          TextButton(
            onPressed: () => NavigateToPage.instance?.navigate(context,
                index: 2,
                currentIndex: const NavigationState().currentIndex,
                route: Collections.routeName),
            child: const Text(
              'Добавить',
              style: TextStyle(
                decoration: TextDecoration.underline,
                fontSize: 14.0,
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
