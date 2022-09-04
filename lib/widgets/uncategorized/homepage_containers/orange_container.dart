import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

class OrangeContainer extends StatelessWidget {
  const OrangeContainer({Key? key, required this.screenWidth})
      : super(key: key);
  final double screenWidth;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth / 2.3,
      height: 95.0,
      decoration: const BoxDecoration(
          color: AppColors.yellow100,
          borderRadius: BorderRadius.all(
            Radius.circular(15.0),
          )),
      child: const Center(
        child: Text(
          'Tут',
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.white,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
