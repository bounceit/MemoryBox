import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../custom_shape.dart';
import '../../recursec/app_colors.dart';

class AudioShape extends StatelessWidget {
  const AudioShape({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        Container(
          height: screenHeight - 175,
        ),
        ClipPath(
          clipper: Customshape(),
          child: Container(
            height: 155,

            // width: double.infinity,
            color: AppColors.audioAppBar,
          ),
        ),
      ],
    );
  }
}
