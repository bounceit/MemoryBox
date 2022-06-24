import 'package:flutter/material.dart';

import '../../recursec/app_colors.dart';
import 'register_text_widget.dart';

class AboutRegisterWidget extends StatelessWidget {
  const AboutRegisterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: AppColors.white100,
        borderRadius: const BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            offset: Offset.fromDirection(1),
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 3,
          ),
        ],
      ),
      child: const AboutRegisterText(),
    );
  }
}
