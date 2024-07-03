library src.app.theme.colors;

import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'app_colors.dart';

class AppThemeColors extends ThemeExtension<AppThemeColors> {
  final Color background;
  final Color primary;
  final Color secondary;
  final Color active;
  final Color activeDeep;
  final Color disabled;
  final Color hint;
  final Color focus;
  final Color unfocus;
  final Color cancel;
  final Color alert;
  final Color arrowBack;

  const AppThemeColors({
    required this.background,
    required this.primary,
    required this.secondary,
    required this.active,
    required this.activeDeep,
    required this.disabled,
    required this.hint,
    required this.focus,
    required this.unfocus,
    required this.cancel,
    required this.alert,
    required this.arrowBack,
  });

  @override
  AppThemeColors copyWith({
    Color? background,
    Color? primary,
    Color? secondary,
    Color? active,
    Color? activeDeep,
    Color? disabled,
    Color? hint,
    Color? focus,
    Color? unfocus,
    Color? cancel,
    Color? alert,
    Color? arrowBack,
  }) =>
      AppThemeColors(
        background: background ?? this.background,
        primary: primary ?? this.primary,
        secondary: secondary ?? this.secondary,
        active: active ?? this.active,
        activeDeep: activeDeep ?? this.activeDeep,
        disabled: disabled ?? this.disabled,
        hint: hint ?? this.hint,
        focus: focus ?? this.focus,
        unfocus: unfocus ?? this.unfocus,
        cancel: cancel ?? this.cancel,
        alert: alert ?? this.alert,
        arrowBack: arrowBack ?? this.arrowBack,
      );

  @override
  ThemeExtension<AppThemeColors> lerp(
    ThemeExtension<AppThemeColors>? other,
    double t,
  ) {
    if (other is! AppThemeColors) {
      return this;
    }

    return AppThemeColors(
      background: Color.lerp(
        background,
        other.background,
        t,
      )!,
      primary: Color.lerp(
        primary,
        other.primary,
        t,
      )!,
      secondary: Color.lerp(
        secondary,
        other.secondary,
        t,
      )!,
      active: Color.lerp(
        active,
        other.active,
        t,
      )!,
      activeDeep: Color.lerp(
        activeDeep,
        other.activeDeep,
        t,
      )!,
      disabled: Color.lerp(
        disabled,
        other.disabled,
        t,
      )!,
      hint: Color.lerp(
        hint,
        other.hint,
        t,
      )!,
      focus: Color.lerp(
        focus,
        other.focus,
        t,
      )!,
      unfocus: Color.lerp(
        unfocus,
        other.unfocus,
        t,
      )!,
      cancel: Color.lerp(
        cancel,
        other.cancel,
        t,
      )!,
      alert: Color.lerp(
        alert,
        other.alert,
        t,
      )!,
      arrowBack: Color.lerp(
        arrowBack,
        other.arrowBack,
        t,
      )!,
    );
  }

  static const light = AppThemeColors(
    background: AppColors.white,
    primary: AppColors.grey555555,
    secondary: AppColors.white,
    active: AppColors.mint3FB8AF,
    activeDeep: AppColors.mint268A82,
    disabled: AppColors.greyB6B6B6,
    hint: AppColors.greyD6D6D6,
    focus: AppColors.mint3FB8AF,
    unfocus: AppColors.greyD6D6D6,
    cancel: AppColors.redB24D4D,
    alert: AppColors.redD73B3B,
    arrowBack: AppColors.black,
  );

  static const dark = AppThemeColors(
    background: AppColors.black2E2E2E,
    primary: AppColors.white,
    secondary: AppColors.grey3F3F3F,
    active: AppColors.mint3FB8AF,
    activeDeep: AppColors.mint268A82,
    disabled: AppColors.greyB6B6B6,
    hint: AppColors.grey707070,
    focus: AppColors.mint3FB8AF,
    unfocus: AppColors.grey707070,
    cancel: AppColors.redB24D4D,
    alert: AppColors.redD73B3B,
    arrowBack: AppColors.white,
  );
}
