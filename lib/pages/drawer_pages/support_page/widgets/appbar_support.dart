import 'package:audio_fairy_tales/custom_shape.dart';
import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

class AppbarMenuSupportMessagePage extends StatelessWidget {
  const AppbarMenuSupportMessagePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double screenHeight = MediaQuery.of(context).size.height;
    return Stack(children: [
      Container(
        height: screenHeight / 1.27,
      ),
      ClipPath(
        clipper: Customshape(),
        child: Container(
          color: AppColors.colorAppbar,
          width: double.infinity,
          height: 125.0,
        ),
      ),
    ]);
  }
}
