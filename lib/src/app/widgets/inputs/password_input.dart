library src.app.widgets.inputs.password;

import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/widgets/widgets.dart';
import 'package:flutter/material.dart';

import '../../assets_gen/assets.gen.dart';
import '../../localization/lang/locale_keys.g.dart';
import '../../theme/app_theme.dart';

class PasswordInput extends CommonInputField {
  final Color prefixIconColor;
  final VoidCallback onSuffixTap;
  final String? hint;

  PasswordInput({
    super.key,
    super.controller,
    this.prefixIconColor = AppColors.greyD6D6D6,
    super.validation,
    super.obscureText,
    required this.onSuffixTap,
    this.hint,
    super.textInputAction,
  }) : super(
          prefixIcon: InputFieldIconWrapper(
            baseline: 23,
            assetPath: Assets.icons.iconLock.path,
          ),
          hintText: hint ?? LocaleKeys.app_auth_login_input_hint_password.tr(),
          suffixIcon: InputFieldIconWrapper(
            onPressed: onSuffixTap,
            baseline: obscureText ? 25 : 23,
            assetPath: obscureText
                ? Assets.icons.iconHidePassword.path
                : Assets.icons.iconShowPassword.path,
          ),
        );
}
