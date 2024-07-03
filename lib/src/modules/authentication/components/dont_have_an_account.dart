library src.modules.auth.components.dont_have_an_account;

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/localization/lang/locale_keys.g.dart';
import 'package:flutter/material.dart';

import '../../../app/widgets/widgets.dart';

class DontHaveAnAccount extends StatelessWidget {
  final VoidCallback? onTextTap;

  const DontHaveAnAccount({
    super.key,
    this.onTextTap,
  });

  @override
  Widget build(BuildContext context) => CombinedTwoPhraseTappableText(
        firstPhrase: "${LocaleKeys.app_auth_login_dont_have_an_account.tr()} ",
        secondPhrase: LocaleKeys.app_auth_login_button_sign_up.tr(),
        onTextTap: onTextTap,
      );
}
