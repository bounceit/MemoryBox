<<<<<<< Updated upstream
=======
import 'package:audio_fairy_tales/recursec/app_colors.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';

import '../../custom_shape.dart';

class MainClipPath extends StatelessWidget {
  const MainClipPath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
<<<<<<< Updated upstream
    return ClipPath(
      clipper: Customshape(),
      child: Container(
        height: 370,
        width: MediaQuery.of(context).size.width,
        color: const Color.fromRGBO(140, 132, 226, 1),
      ),
=======
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
>>>>>>> Stashed changes
    );
  }
}
