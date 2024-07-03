library src.app.widgets.inputs.common;

import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/models/models.dart';
import 'package:financial_management/src/app/widgets/icon_wrapper/icon_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CommonInputField extends StatefulWidget {
  final bool autofocus;
  final bool readOnly;
  final TextEditingController? controller;
  final TextFieldValidation? validation;
  final Widget? label;
  final Widget? prefix;
  final Widget? suffix;
  final IconWrapper? prefixIcon;
  final IconWrapper? suffixIcon;
  final Function(String)? onChanged;
  final Function()? onEditingComplete;
  final TextStyle? hintTextStyle;
  final TextStyle? inputTextStyle;
  final bool obscureText;
  final String obscuringCharacter;
  final TextInputType? keyboardType;
  final Function(String)? onFieldSubmitted;
  final Function(String?)? onSaved;
  final bool enabled;
  final List<TextInputFormatter>? inputFormatters;
  final bool cursorOpacityAnimates;
  final String? hintText;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  const CommonInputField({
    super.key,
    this.autofocus = false,
    this.readOnly = false,
    this.controller,
    this.validation,
    this.label,
    this.prefix,
    this.suffix,
    this.prefixIcon,
    this.suffixIcon,
    this.onChanged,
    this.onEditingComplete,
    this.hintTextStyle,
    this.inputTextStyle,
    this.obscureText = false,
    this.obscuringCharacter = '•',
    this.keyboardType,
    this.onFieldSubmitted,
    this.onSaved,
    this.enabled = true,
    this.inputFormatters,
    this.cursorOpacityAnimates = true,
    this.hintText,
    this.focusNode,
    this.textInputAction,
  });

  @override
  State<CommonInputField> createState() => _CommonInputFieldState();
}

class _CommonInputFieldState extends State<CommonInputField> {
  late final FocusNode _focusNode;

  void _focusNodeListener() => setState(() {});

  void _init() {
    _focusNode = widget.focusNode ?? FocusNode();
    _focusNode.addListener(_focusNodeListener);
    setState(() {});
  }

  void _dispose() {
    _focusNode.removeListener(_focusNodeListener);
    _focusNode.dispose();
  }

  @override
  void initState() {
    super.initState();
    _init();
  }

  @override
  void dispose() {
    _dispose();
    super.dispose();
  }

  String? get errorMessage => widget.validation?.errors
      .map(
        (error) => error.message,
      )
      .toList()
      .join(", ");

  @override
  Widget build(BuildContext context) => TextFormField(
        focusNode: _focusNode,
        decoration: InputDecoration(
          label: widget.label,
          errorText: (widget.validation?.isValid ?? true)
              ? null
              : widget.validation?.errors
                  .map(
                    (error) => error.message,
                  )
                  .toList()
                  .join("\n"),
          hintText: widget.hintText,
          hintStyle: widget.hintTextStyle,
          prefix: widget.prefix,
          suffix: widget.suffix,
          prefixIcon: widget.prefixIcon?.copyWith(
            color: _focusNode.hasFocus ? context.color.active : null,
          ),
          suffixIcon: widget.suffixIcon?.copyWith(
            color: _focusNode.hasFocus ? context.color.active : null,
          ),
        ),
        textAlign: TextAlign.left,
        textAlignVertical: TextAlignVertical.center,
        textInputAction: widget.textInputAction,
        keyboardType: widget.keyboardType,
        controller: widget.controller,
        autofocus: widget.autofocus,
        readOnly: widget.readOnly,
        onChanged: widget.onChanged,
        onEditingComplete: widget.onEditingComplete,
        style: widget.inputTextStyle ?? context.text.headline4Medium,
        obscureText: widget.obscureText,
        obscuringCharacter: widget.obscuringCharacter,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        enabled: widget.enabled,
        inputFormatters: widget.inputFormatters,
        cursorOpacityAnimates: widget.cursorOpacityAnimates,
      );
}
