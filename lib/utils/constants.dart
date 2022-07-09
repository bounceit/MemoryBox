import 'package:flutter/material.dart';

import '../recursec/app_colors.dart';

const kTitleTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 48.0,
  fontFamily: 'TTNorms',
  fontWeight: FontWeight.bold,
);
const kTitleTextStyle2 = TextStyle(
  color: Colors.white,
  fontSize: 34.0,
  fontFamily: 'TTNorms',
  fontWeight: FontWeight.bold,
);
const kTitle2TextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 14.0,
    color: Colors.white,
    fontWeight: FontWeight.w400);
const kTitle5TextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 10.0,
    color: Colors.white,
    fontWeight: FontWeight.w400);
const kTitle4TextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 14.0,
    color: Colors.white,
    fontWeight: FontWeight.w700);
const kTitle2TextStyle2 = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 16.0,
  color: Colors.white,
);
const kTitle3TextStyle3 = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 16.0,
  color: AppColors.colorText,
);
const kDraverTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 18.0,
  color: AppColors.colorText,
);
const kBodiTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 24.0,
  fontWeight: FontWeight.w400,
  color: AppColors.colorText,
);
const kBodi2TextStyle = TextStyle(
    fontFamily: 'TTNorms',
    fontSize: 14.0,
    color: AppColors.colorText,
    fontWeight: FontWeight.w400);
const kBodi2ColorRedTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 14.0,
  color: AppColors.pink,
);
const kBodiOverlineTextStyle = TextStyle(
  fontFamily: 'TTNorms',
  fontSize: 14.0,
  color: AppColors.colorText,
  decoration: TextDecoration.underline,
);
<<<<<<< Updated upstream
const kLinkColorText = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w400, color: AppColors.colorTextLink);
const kBottombarTextStyle = TextStyle(
=======
const linkColorText = TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: AppColors.colorTextLink,
);
const bottombarTextStyle = TextStyle(
>>>>>>> Stashed changes
  fontFamily: 'TTNorms',
  fontSize: 10.0,
  color: AppColors.colorText,
);

const kBorderContainer2 = BoxDecoration(
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
