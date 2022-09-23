import 'package:audio_fairy_tales/widgets/uncategorized/custom_shape.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';

class AppbarHeaderProfileProfile extends StatelessWidget {
  const AppbarHeaderProfileProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ClipPath(
          clipper: Customshape(),
          child: Container(
            color: AppColors.colorAppbar,
            width: double.infinity,
            height: 200.0,
          ),
        ),
        const Align(
          alignment: Alignment.topCenter,
          child: Text(
            'Твоя частичка',
            style: twoTitleTextStyle,
          ),
        ),
      ],
    );
  }
}
