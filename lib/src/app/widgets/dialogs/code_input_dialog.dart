library src.app.widgets.dialogs.code_input;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/theme/app_theme.dart';
import 'package:financial_management/src/app/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:pincode_input_fields/pincode_input_fields.dart';

class CodeInputDialog extends StatelessWidget {
  final String title;
  final String? description;
  final Duration? remainTime;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final VoidCallback? onButtonPressed;
  final String? buttonTitle;
  final bool buttonEnabled;

  const CodeInputDialog({
    super.key,
    required this.title,
    this.description,
    this.remainTime,
    this.onChanged,
    this.onEditingComplete,
    this.onButtonPressed,
    this.buttonTitle,
    this.buttonEnabled = true,
  });

  static Future<T?> show<T>({
    required BuildContext context,
    required String title,
    String? description,
    Duration? remainTime,
    Function(String)? onChanged,
    Function()? onEditingComplete,
    VoidCallback? onButtonPressed,
    Color? barrierColor,
    String? buttonTitle,
    bool buttonEnabled = true,
  }) async =>
      await showDialog<T>(
        context: context,
        barrierColor: barrierColor ??
            AppColors.black.withOpacity(
              0.2,
            ),
        builder: (_) => CodeInputDialog(
          title: title,
          description: description,
          remainTime: remainTime,
          onChanged: onChanged,
          onEditingComplete: onEditingComplete,
          onButtonPressed: onButtonPressed,
          buttonTitle: buttonTitle,
          buttonEnabled: buttonEnabled,
        ),
      );

  @override
  Widget build(BuildContext context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 28,
            ),
            child: Material(
              elevation: 0,
              color: context.color.background,
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 20,
                  horizontal: 28,
                ),
                child: Column(
                  children: [
                    Text(
                      title,
                      textAlign: TextAlign.center,
                      style: context.text.headline4Bold,
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    if (description is String)
                      Text(
                        description!,
                        textAlign: TextAlign.center,
                        style: context.text.headline4Medium.copyWith(
                          fontSize: 18,
                        ),
                      ),
                    if (description is String)
                      const SizedBox(
                        height: 30,
                      ),
                    PincodeInputFields(
                      onChanged: onChanged,
                      onInputComplete: onEditingComplete,
                      length: 6,
                      borderRadius: null,
                      width: double.infinity,
                      focusBorder: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: context.color.active,
                        ),
                      ),
                      unfocusBorder: Border(
                        bottom: BorderSide(
                          width: 2,
                          color: context.color.unfocus,
                        ),
                      ),
                    ),
                    if (buttonTitle is String)
                      const SizedBox(
                        height: 88,
                      ),
                    if (buttonTitle is String)
                      PrimaryButton(
                        disabled: !buttonEnabled,
                        title: buttonTitle,
                        onPressed: onButtonPressed,
                      )
                  ],
                ),
              ),
            ),
          ),
        ],
      );
}
