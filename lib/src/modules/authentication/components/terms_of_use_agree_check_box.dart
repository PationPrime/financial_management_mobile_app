library src.app.modules.auth.components.terms_of_use_agree_check_box;

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../app/localization/lang/locale_keys.g.dart';

class TermsOfUseAgreeCheckBox extends StatelessWidget {
  final bool initialValue;
  final Function(bool value)? onPressed;
  final VoidCallback? onTextTap;

  const TermsOfUseAgreeCheckBox({
    super.key,
    required this.initialValue,
    this.onPressed,
    this.onTextTap,
  });

  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AppCheckBox(
            initialValue: initialValue,
            onPressed: onPressed,
          ),
          const SizedBox(
            width: 10,
          ),
          Flexible(
            child: CombinedTwoPhraseTappableText(
              firstPhrase: "${LocaleKeys.app_auth_sign_up_agree_to_all.tr()} ",
              secondPhrase:
                  LocaleKeys.app_auth_sign_up_button_terms_and_conditions.tr(),
              onTextTap: onTextTap,
            ),
          ),
        ],
      );
}
