import 'package:flutter/material.dart';

class SecondText extends StatelessWidget {
  const SecondText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
        'Мы рады видеть тебя здесь.\n Это приложение поможет записывать сказки и держать их в удобном месте не заполняя память на телефоне',
        textAlign: TextAlign.center,
        style: TextStyle(
          fontFamily: 'TT Norms',
          fontWeight: FontWeight.w400,
          fontSize: 16,
        ),
        maxLines: 4);
  }
}

class FirstText extends StatelessWidget {
  const FirstText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Привет!',
      style: TextStyle(
        fontFamily: 'TT Norms',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 1.2,
      ),
    );
  }
}

class AboutRegisterText extends StatelessWidget {
  const AboutRegisterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Регистрация привяжет твои сказки  к облаку, после чего они всегда будут с тобой',
      style: TextStyle(
          fontFamily: 'TT Norms',
          fontSize: 14,
          fontWeight: FontWeight.w400,
          color: Color.fromRGBO(58, 58, 85, 1)),
      textAlign: TextAlign.center,
      maxLines: 3,
    );
  }
}

class TextRegister extends StatelessWidget {
  const TextRegister({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Регистрация',
      style: TextStyle(
        fontFamily: 'NormsBold',
        fontSize: 48,
        color: Colors.white,
        fontWeight: FontWeight.w700,
        letterSpacing: 3,
      ),
    );
  }
}

class AddNumberText extends StatelessWidget {
  const AddNumberText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Введи номер телефона',
      style: TextStyle(fontFamily: 'TT Norms'),
    );
  }
}

class LetterText extends StatelessWidget {
  const LetterText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      'Позже',
      style: TextStyle(
        fontFamily: 'TT Norms',
        fontWeight: FontWeight.bold,
        fontSize: 24,
        letterSpacing: 1,
        color: Color.fromRGBO(58, 58, 85, 1),
      ),
    );
  }
}
