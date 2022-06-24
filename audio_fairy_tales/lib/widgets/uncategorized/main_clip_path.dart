import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

import '../../custom_shape.dart';

class MainClipPath extends StatelessWidget {
  const MainClipPath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: screenHeight - 150,
        ),
        ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 275,
            // width: double.infinity,
            color: AppColors.violet,
          ),
        ),
      ],
    );
  }
}
