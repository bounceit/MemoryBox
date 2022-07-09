import 'package:flutter/material.dart';

ButtonStyle buttonRegisterStyle = ButtonStyle(
    backgroundColor: MaterialStateProperty.all(
      const Color.fromRGBO(241, 180, 136, 1),
    ),
    padding: MaterialStateProperty.all(
      const EdgeInsets.symmetric(
        horizontal: 100,
        vertical: 20,
      ),
    ),
    shape: MaterialStateProperty.all(RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(50),
    )));
