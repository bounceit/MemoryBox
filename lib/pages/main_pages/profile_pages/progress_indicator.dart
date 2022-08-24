import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

class CustomProgressIndicator extends StatelessWidget {
  const CustomProgressIndicator({Key? key, this.size}) : super(key: key);
  final int? size;

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(
                Radius.circular(50.0),
              ),
              border: Border.all(color: AppColors.colorText, width: 2.0)),
          margin: const EdgeInsets.symmetric(vertical: 5.0),
          width: screenWidth * 0.75,
          height: 30.0,
          child: ClipRRect(
            borderRadius: const BorderRadius.all(
              Radius.circular(50.0),
            ),
            child: LinearProgressIndicator(
              value: (300) / 500,
              valueColor: const AlwaysStoppedAnimation<Color>(
                AppColors.yellow100,
              ),
              backgroundColor: Colors.white,
            ),
          ),
        ),
        Text('300.00/500.00 мб')
        // Text('${(size! / 1048576.toDouble()).toStringAsFixed(2)}/500 мб')
      ],
    );
  }
}
