library src.app.widgets.app_check_box;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:financial_management/src/app/widgets/buttons/buttons.dart';
import 'package:flutter/material.dart';

class AppCheckBox extends StatefulWidget {
  final bool disabled;
  final bool initialValue;
  final Function(bool)? onPressed;
  final Duration animationDuration;
  final Color? borderColor;
  final Color? fillColor;
  final BoxShape boxShape;
  final BorderRadius borderRadius;
  final double size;

  const AppCheckBox({
    super.key,
    this.disabled = false,
    required this.initialValue,
    this.onPressed,
    this.animationDuration = const Duration(
      milliseconds: 150,
    ),
    this.borderColor,
    this.fillColor,
    this.boxShape = BoxShape.rectangle,
    this.borderRadius = const BorderRadius.all(
      Radius.circular(4),
    ),
    this.size = 21,
  });

  @override
  State<AppCheckBox> createState() => _AppCheckBoxState();
}

class _AppCheckBoxState extends State<AppCheckBox> {
  late bool _value;

  void _toggleValue() {
    setState(
      () => _value = !_value,
    );

    widget.onPressed?.call(_value);
  }

  @override
  void initState() {
    super.initState();
    setState(
      () => _value = widget.initialValue,
    );
  }

  @override
  Widget build(BuildContext context) => BouncyButtonWrapper(
        onPressed: widget.disabled ? null : _toggleValue,
        child: AnimatedContainer(
          height: widget.size,
          width: widget.size,
          duration: widget.animationDuration,
          decoration: BoxDecoration(
            borderRadius:
                widget.boxShape == BoxShape.circle ? null : widget.borderRadius,
            color: _value
                ? widget.disabled
                    ? context.color.disabled
                    : widget.fillColor ?? context.color.active
                : AppColors.transparent,
            border: Border.all(
              width: 2,
              color: !_value
                  ? widget.disabled
                      ? context.color.disabled
                      : context.color.active
                  : widget.borderColor ?? context.color.active,
            ),
          ),
          alignment: Alignment.center,
          child: !_value
              ? null
              : Icon(
                  Icons.check,
                  color: AppColors.white,
                  size: widget.size * 0.8,
                ),
        ),
      );
}
