library src.app.widgets.tappable_text.combained_two_phrase_tappable_text;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class CombinedTwoPhraseTappableText extends StatelessWidget {
  final String firstPhrase;
  final String secondPhrase;
  final VoidCallback? onTextTap;

  const CombinedTwoPhraseTappableText({
    super.key,
    required this.firstPhrase,
    required this.secondPhrase,
    this.onTextTap,
  });

  @override
  Widget build(BuildContext context) => RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: firstPhrase,
              style: context.text.headline5SemiBold.copyWith(
                fontSize: 14,
                color: context.color.primary,
              ),
            ),
            TextSpan(
              text: secondPhrase,
              style: context.text.headline5SemiBold.copyWith(
                fontSize: 14,
                color: context.color.active,
                decoration: TextDecoration.underline,
              ),
              recognizer: TapGestureRecognizer()..onTap = onTextTap,
            ),
          ],
        ),
      );
}
