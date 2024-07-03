library src.app.widgets.buttons.primary;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:flutter/material.dart';

import 'bouncy_button_wrapper/bouncy_button_wrapper.dart';

class PrimaryButton extends StatelessWidget {
  final String? title;
  final TextStyle? titleTextStyle;
  final Widget? child;
  final Widget? leftIcon;
  final Widget? rightIcon;
  final BoxDecoration? decoration;
  final bool disabled;
  final Color? backgroundColor;
  final Color titleColor;
  final BorderRadius borderRadius;
  final double? height;
  final double width;
  final VoidCallback? onPressed;
  final Duration containerAnimationDuration;

  const PrimaryButton({
    super.key,
    this.title,
    this.titleTextStyle,
    this.child,
    this.leftIcon,
    this.rightIcon,
    this.decoration,
    this.disabled = false,
    this.backgroundColor,
    this.titleColor = AppColors.white,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(12),
    ),
    this.height,
    this.width = double.infinity,
    this.onPressed,
    this.containerAnimationDuration = const Duration(milliseconds: 150),
  });

  @override
  Widget build(BuildContext context) => BouncyButtonWrapper(
        scaleFactor: 0.98,
        onPressed: disabled || onPressed is! VoidCallback ? null : onPressed,
        child: AnimatedContainer(
          duration: containerAnimationDuration,
          padding: const EdgeInsets.symmetric(
            vertical: 13,
          ),
          decoration: decoration ??
              BoxDecoration(
                color: disabled || onPressed is! VoidCallback
                    ? context.color.disabled
                    : backgroundColor ?? context.color.active,
                borderRadius: borderRadius,
              ),
          height: height,
          width: width,
          child: child ??
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (leftIcon is Widget) leftIcon!,
                  if (title is String)
                    Flexible(
                      child: Text(
                        title!,
                        overflow: TextOverflow.ellipsis,
                        style: titleTextStyle ??
                            context.text.headline4SemiBold.copyWith(
                              color: titleColor,
                            ),
                      ),
                    ),
                  if (rightIcon is Widget) rightIcon!,
                ],
              ),
        ),
      );
}
