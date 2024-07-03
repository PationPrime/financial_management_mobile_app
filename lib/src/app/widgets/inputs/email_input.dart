library src.app.widgets.inputs.email;

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/assets_gen/assets.gen.dart';
import 'package:financial_management/src/app/localization/lang/locale_keys.g.dart';
import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import '../widgets.dart';

class EmailInput extends CommonInputField {
  final Color prefixIconColor;

  EmailInput({
    super.key,
    super.controller,
    this.prefixIconColor = AppColors.greyD6D6D6,
    super.validation,
    super.textInputAction,
  }) : super(
          prefixIcon: InputFieldIconWrapper(
            assetPath: Assets.icons.iconMail.path,
          ),
          hintText: LocaleKeys.app_auth_login_input_hint_email.tr(),
        );
}
