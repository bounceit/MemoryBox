import 'package:flutter/material.dart';

class RegisterButtonText extends StatelessWidget {
  const RegisterButtonText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Продолжить',
      style: TextStyle(
          fontFamily: 'NormsBold',
          fontWeight: FontWeight.bold,
          fontSize: 16,
          letterSpacing: 0.2),
    );
  }
}
