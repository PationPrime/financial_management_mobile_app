library src.app.widgets.tappable_text;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class TabbableText extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final bool underlined;
  final TextDecoration? decoration;
  final VoidCallback? onTap;
  final bool enabled;

  const TabbableText({
    super.key,
    required this.text,
    this.textStyle,
    this.underlined = true,
    this.decoration,
    this.onTap,
    this.enabled = true,
  });

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          text: text,
          style: !enabled
              ? context.text.headline5SemiBold.copyWith(
                  fontSize: 14,
                  color: context.color.disabled,
                  decoration: decoration ??
                      (underlined ? TextDecoration.underline : null),
                )
              : textStyle ??
                  context.text.headline5SemiBold.copyWith(
                    fontSize: 14,
                    color: context.color.active,
                    decoration: decoration ??
                        (underlined ? TextDecoration.underline : null),
                  ),
          recognizer: !enabled ? null : (TapGestureRecognizer()..onTap = onTap),
        ),
      );
}
