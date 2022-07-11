import 'package:flutter/material.dart';

import '../recursec/app_colors.dart';

const oneTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 48.0,
  fontFamily: 'TTNorms',
  fontWeight: FontWeight.bold,
);
const twoTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 34.0,
  fontFamily: 'TTNorms',
  fontWeight: FontWeight.bold,
);
const threeTitleTextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 14.0,
    color: Colors.white,
    fontWeight: FontWeight.w400);
const fourTitleTextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 10.0,
    color: Colors.white,
    fontWeight: FontWeight.w400);
const fiveTitleTextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 14.0,
    color: Colors.white,
    fontWeight: FontWeight.w700);
const sixTitleTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 16.0,
  color: Colors.white,
);
const sevenTitleTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 16.0,
  color: AppColors.colorText,
);
const draverTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 18.0,
  color: AppColors.colorText,
);
const bodyTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
  color: AppColors.colorText,
);
const twoBodyTextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 14.0,
    color: AppColors.colorText,
    fontWeight: FontWeight.w400);
const threeBodyPinkTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 14.0,
  color: AppColors.pink,
);
const bodyOverlineTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 14.0,
  color: AppColors.colorText,
  decoration: TextDecoration.underline,
);
const linkColorText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColors.colorTextLink,
);
const bottombarTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 10.0,
  color: AppColors.colorText,
);

const borderContainer2 = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20.0),
      topRight: Radius.circular(20.0),
    ));

BoxDecoration boxDecoration = BoxDecoration(
  boxShadow: [
    BoxShadow(
      offset: Offset.fromDirection(1),
      color: Colors.grey.withOpacity(0.5),
      spreadRadius: 2,
      blurRadius: 5,
    ),
  ],
  color: AppColors.white100,
  borderRadius: const BorderRadius.only(
    topLeft: Radius.circular(20),
    topRight: Radius.circular(20),
  ),
);

String formatNumberTwo(int number) {
  String numberStr = number.toString();
  if (number < 10) {
    numberStr = '0$numberStr';
  }

  return numberStr;
}
