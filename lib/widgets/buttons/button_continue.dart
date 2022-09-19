import 'package:audio_fairy_tales/recursec/app_colors.dart';
import 'package:flutter/material.dart';

class ButtonContinue extends StatelessWidget {
  const ButtonContinue({Key? key, this.onPressed, required this.text})
      : super(key: key);
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ButtonStyle(
        minimumSize: MaterialStateProperty.all(
          const Size(275.0, 50.0),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0),
          ),
        ),
        backgroundColor: MaterialStateProperty.all(
          AppColors.yellow100,
        ),
      ),
      child: Text(
        text,
        style: const TextStyle(fontSize: 18.0, color: AppColors.white100),
      ),
    );
  }
}
