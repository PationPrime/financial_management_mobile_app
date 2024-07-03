library src.app.theme.app_text_styles;

import 'package:flutter/material.dart';

abstract base class AppTextStyles {
  static const _montserratFontFamily = "Montserrat";

  static const montserratExtraBold = TextStyle(
    fontSize: 18,
    fontFamily: _montserratFontFamily,
    fontWeight: FontWeight.w800,
  );

  static const montserratBold = TextStyle(
    fontSize: 20,
    fontFamily: _montserratFontFamily,
    fontWeight: FontWeight.w700,
  );

  static const montserratSemiBold = TextStyle(
    fontSize: 20,
    fontFamily: _montserratFontFamily,
    fontWeight: FontWeight.w600,
  );

  static const montserratMedium = TextStyle(
    fontSize: 20,
    fontFamily: _montserratFontFamily,
    fontWeight: FontWeight.w500,
  );

  static const montserratRegular = TextStyle(
    fontSize: 20,
    fontFamily: _montserratFontFamily,
    fontWeight: FontWeight.w400,
  );
}
