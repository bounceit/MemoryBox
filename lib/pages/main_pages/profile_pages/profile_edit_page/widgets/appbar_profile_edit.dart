import 'package:audio_fairy_tales/widgets/uncategorized/custom_shape.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../../../../utils/constants.dart';
import '../../../../../widgets/buttons/icon_back.dart';

class AppbarHeaderProfileEdit extends StatelessWidget {
  const AppbarHeaderProfileEdit({Key? key}) : super(key: key);

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
            height: 280.0,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(
            top: 30.0,
            left: 15.0,
            right: 10.0,
          ),
          child: IconBack(
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 30.0,
            left: 10.0,
            right: 10.0,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Профиль',
              style: twoTitleTextStyle,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(
            top: 75.0,
          ),
          child: Align(
            alignment: Alignment.center,
            child: Text(
              'Твоя частичка',
              style: twoTitleTextStyle,
            ),
          ),
        ),
      ],
    );
  }
}
