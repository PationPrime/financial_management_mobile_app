library src.app.widgets.inputs.input_field_icon_wrapper;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/widgets/icon_wrapper/icon_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../buttons/bouncy_button_wrapper/bouncy_button_wrapper.dart';

class InputFieldIconWrapper extends IconWrapper {
  final String assetPath;
  final double baseline;
  final VoidCallback? onPressed;

  const InputFieldIconWrapper({
    super.key,
    required this.assetPath,
    this.baseline = 21,
    super.color,
    this.onPressed,
  });

  @override
  IconWrapper copyWith({
    Color? color,
  }) =>
      InputFieldIconWrapper(
        color: color ?? this.color,
        baseline: baseline,
        assetPath: assetPath,
        onPressed: onPressed,
      );

  @override
  Widget build(BuildContext context) => BouncyButtonWrapper(
        scaleFactor: 0.95,
        onPressed: onPressed,
        child: SizedBox(
          height: 14,
          width: 18,
          child: Center(
            child: Baseline(
              baseline: baseline,
              baselineType: TextBaseline.ideographic,
              child: SvgPicture.asset(
                assetPath,
                colorFilter: ColorFilter.mode(
                  color ?? context.color.hint,
                  BlendMode.srcIn,
                ),
              ),
            ),
          ),
        ),
      );
}
