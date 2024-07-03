// ignore_for_file: constant_identifier_names

library src.app.localization;

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import 'lang/codegen_loader.g.dart';

class AppLocalization extends StatelessWidget {
  static const Locale _EN = Locale('en', 'US');
  static const Locale _RU = Locale('ru', 'RU');

  static const List<Locale> _fallbackSupportedLocales = [
    _EN,
    _RU,
  ];
  static const Locale defaultFallbackLocale = _EN;

  final WidgetBuilder builder;
  final List<Locale>? supportedLocales;
  final Locale? fallbackLocale;

  const AppLocalization({
    super.key,
    required this.builder,
    this.supportedLocales,
    this.fallbackLocale,
  });

  @override
  Widget build(BuildContext context) => EasyLocalization(
        supportedLocales: supportedLocales ?? _fallbackSupportedLocales,
        path: 'assets/lang/',
        fallbackLocale: fallbackLocale ?? defaultFallbackLocale,
        assetLoader: const CodegenLoader(),
        saveLocale: true,
        child: Builder(builder: builder),
      );
}
