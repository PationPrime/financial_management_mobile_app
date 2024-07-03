library src.app.widgets.titles.auth;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:flutter/material.dart';

class AuthTitle extends StatelessWidget {
  final String text;

  const AuthTitle({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) => Text(
        text,
        style: context.text.headline1Bold,
      );
}
