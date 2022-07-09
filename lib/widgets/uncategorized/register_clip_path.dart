import 'package:flutter/material.dart';

import '../../custom_shape.dart';
import '../../recursec/app_colors.dart';

class ClipPathWidget extends StatelessWidget {
  const ClipPathWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: Customshape(),
      child: const RegisterClipPath(),
    );
  }
}

class RegisterClipPath extends StatelessWidget {
  const RegisterClipPath({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      width: MediaQuery.of(context).size.width,
      color: AppColors.violet,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 46),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text(
              "MemoryBox",
              style: TextStyle(
                fontFamily: 'NormsBold',
                fontSize: 48,
                color: AppColors.white100,
                fontWeight: FontWeight.w700,
                letterSpacing: 3,
              ),
            ),
            Text(
              "Твой голос всегда рядом",
              style: TextStyle(
                fontFamily: 'NormsBold',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: AppColors.white100,
                letterSpacing: 0.2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
