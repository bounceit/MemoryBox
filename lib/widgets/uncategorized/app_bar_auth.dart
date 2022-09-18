import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class AppbarHeaderAuthorization extends StatelessWidget {
  const AppbarHeaderAuthorization({
    Key? key,
    this.title,
    this.subtitle,
  }) : super(key: key);
  final String? title;
  final String? subtitle;

  @override
  Widget build(BuildContext context) {
    return ClipPath(
        clipper: Customshape(),
        child: Container(
          color: AppColors.colorAppbar,
          width: double.infinity,
          height: 285.0,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  title!,
                  style: twoTitleTextStyle,
                ),
                Text(
                  subtitle!,
                  style: threeTitleTextStyle,
                )
              ],
            ),
          ),
        ));
  }
}
