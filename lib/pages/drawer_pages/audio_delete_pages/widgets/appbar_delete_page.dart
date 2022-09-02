import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../utils/constants.dart';

class AppbarHeaderDeletePage extends StatelessWidget {
  const AppbarHeaderDeletePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(),
        ClipPath(
          clipper: Customshape(),
          child: Container(
            color: AppColors.colorAppbar,
            width: double.infinity,
            height: 125.0,
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              'удаленные',
              style: twoTitleTextStyle,
            ),
          ],
        ),
      ],
    );
  }
}
