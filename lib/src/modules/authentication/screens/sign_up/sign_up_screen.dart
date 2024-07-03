library src.modules.authentication.screens.register;

import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/assets_gen/assets.gen.dart';
import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/extensions/string_extension.dart';
import 'package:financial_management/src/app/models/models.dart';
import 'package:financial_management/src/app/tools/tools.dart';
import 'package:flutter/material.dart';

import '../../../../app/constants/constants.dart';
import '../../../../app/localization/lang/locale_keys.g.dart';
import '../../../../app/widgets/widgets.dart';
import '../../components/components.dart';

@RoutePage()
class SignUpScreen extends StatelessWidget implements AutoRouteWrapper {
  const SignUpScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => this;

  @override
  Widget build(BuildContext context) => const _SignUpScreenView();
}

class _SignUpScreenView extends StatefulWidget {
  const _SignUpScreenView();

  @override
  State<_SignUpScreenView> createState() => _SignUpScreenViewState();
}

class _SignUpScreenViewState extends State<_SignUpScreenView> {
  ///
  late final TextEditingController _emailController;
  late final TextEditingController _firstnameController;
  late final TextEditingController _lastnameController;
  late final TextEditingController _passwordController;
  late final TextEditingController _repeatPasswordController;

  ///
  late final ValueNotifierListenersObserver<TextEditingController>
      _textControllersListenerObserver;

  ///
  TextFieldValidation _emailValidation = const TextFieldValidation();
  TextFieldValidation _firstnameValidation = const TextFieldValidation();
  TextFieldValidation _lastnameValidation = const TextFieldValidation();
  TextFieldValidation _passwordValidation = const TextFieldValidation();
  TextFieldValidation _repeatPasswordValidation = const TextFieldValidation();

  ///
  FormValidation get _formValidation => FormValidation(
        validations: [
          _emailValidation,
          _firstnameValidation,
          _lastnameValidation,
          _passwordValidation,
          _repeatPasswordValidation,
        ],
      );

  ///
  bool _showPassword = false;
  bool _showRepeatPassword = false;

  bool _termsAgreed = false;

  ///
  bool _buttonEnabled = false;

  void _toggleTermsAgreement(bool value) {
    _termsAgreed = value;

    _listenButtonEnabled();
  }

  ///
  void _listenButtonEnabled() => setState(
        () => _buttonEnabled = _emailController.value.text.trim().isNotEmpty &&
            _firstnameController.value.text.trim().isNotEmpty &&
            _lastnameController.value.text.trim().isNotEmpty &&
            _passwordController.value.text.trim().isNotEmpty &&
            _repeatPasswordController.value.text.trim().isNotEmpty &&
            _termsAgreed,
      );

  ///
  void _validateEmail() {
    _emailValidation = _emailValidation.copyWith(
      isValid: _emailController.text.isNotEmpty &&
          RegExpConstants.emailRegExp.hasMatch(
            _emailController.text,
          ),
      errors: [
        if (!RegExpConstants.emailRegExp.hasMatch(_emailController.text))
          ValidationError(
            message:
                LocaleKeys.app_auth_sign_up_input_validation_email_invalid.tr(),
          ),
      ],
    );

    setState(() {});
  }

  ///
  void _validateFirstname() {
    final containsDigits = RegExpConstants.digitsRegExp.hasMatch(
      _firstnameController.text,
    );

    _firstnameValidation = _firstnameValidation.copyWith(
      isValid: _firstnameController.text.isNotEmpty && !containsDigits,
      errors: [
        if (containsDigits)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_firstname_contains_digits
                .tr(),
          ),
      ],
    );

    setState(() {});
  }

  ///
  void _validateLastname() {
    final containsDigits = RegExpConstants.digitsRegExp.hasMatch(
      _lastnameController.text,
    );

    _lastnameValidation = _lastnameValidation.copyWith(
      isValid: _lastnameController.text.isNotEmpty && !containsDigits,
      errors: [
        if (containsDigits)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_lastname_contains_digits
                .tr(),
          ),
      ],
    );

    setState(() {});
  }

  ///
  void _validatePassword() {
    final containsDigits = RegExpConstants.digitsRegExp.hasMatch(
      _passwordController.text,
    );

    final containsSpecialCharacter = RegExpConstants.specialCharRegExp.hasMatch(
      _passwordController.text,
    );

    final containsCapitalLetter = RegExpConstants.upperCaseRegExp.hasMatch(
      _passwordController.text,
    );

    final containsLowercaseLetter = RegExpConstants.lowerCaseRegExp.hasMatch(
      _passwordController.text,
    );

    final atLeast8Characters = _passwordController.text.length >= 8;

    final isValid = atLeast8Characters &&
        containsDigits &&
        containsSpecialCharacter &&
        containsCapitalLetter;
    containsLowercaseLetter;

    _passwordValidation = _passwordValidation.copyWith(
      isValid: isValid,
      errors: [
        if (!atLeast8Characters)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_at_least_eight_characters
                .tr(),
          ),
        if (!containsDigits)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_at_least_one_digit
                .tr(),
          ),
        if (!containsSpecialCharacter)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_at_least_one_special_character
                .tr(),
          ),
        if (!containsCapitalLetter)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_at_least_one_capital_letter
                .tr(),
          ),
        if (!containsLowercaseLetter)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_at_least_one_lowercase_letter
                .tr(),
          ),
      ],
    );

    setState(() {});
  }

  ///
  void _validateRepeatPassword() {
    final match = _repeatPasswordController.text.isCompareTo(
      _passwordController.text,
    );

    _repeatPasswordValidation = _repeatPasswordValidation.copyWith(
      isValid: _passwordValidation.isValid && match,
      errors: [
        if (!_passwordValidation.isValid)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_invalid
                .tr(),
          ),
        if (!match)
          ValidationError(
            message: LocaleKeys
                .app_auth_sign_up_input_validation_password_do_not_match
                .tr(),
          )
      ],
    );

    setState(() {});
  }

  ///
  void _validateSignUpForm() {
    _validateEmail();
    _validateFirstname();
    _validateLastname();
    _validatePassword();
    _validateRepeatPassword();
  }

  ///
  void _toggleShowPassword() => setState(
        () => _showPassword = !_showPassword,
      );

  void _toggleShowRepeatPassword() => setState(
        () => _showRepeatPassword = !_showRepeatPassword,
      );

  void _emailControllerListener() {
    if (!_emailValidation.isValid) {
      _validateEmail();
    }
  }

  void _firstnameControllerListener() {
    if (!_firstnameValidation.isValid) {
      _validateFirstname();
    }
  }

  void _lastnameControllerListener() {
    if (!_lastnameValidation.isValid) {
      _validateLastname();
    }
  }

  void _passwordControllerListener() {
    if (!_passwordValidation.isValid) {
      _validatePassword();
    }
  }

  void _repeatPasswordControllerListener() {
    if (!_repeatPasswordValidation.isValid) {
      _validateRepeatPassword();
    }
  }

  final _loadingDialog = CoinSwitchLoadingDialog();

  Future<void> _onSignUpButtonPressed(BuildContext context) async {
    _validateSignUpForm();

    if (!_formValidation.isValid) {
      return;
    }

    String otpCode = "";

    /// sign up logic

    _loadingDialog.show(
      context: context,
    );

    _loadingDialog.hide(
      context,
      delayDuration: const Duration(seconds: 5),
      callBack: () => CodeInputDialog.show(
        context: context,
        title: LocaleKeys.app_auth_email_confirmaion_title.tr(),
        description: LocaleKeys.app_auth_email_confirmaion_description.tr(),
        onChanged: (value) => otpCode = value,
        onEditingComplete: () => const AppLogger(
          where: 'CodeInputDialog.show',
        ).logMessage(
          otpCode,
        ),
        buttonEnabled: false,
        buttonTitle:
            LocaleKeys.app_auth_email_confirmaion_button_resend_code.tr(),
        onButtonPressed: () {},
      ),
    );
  }

  void _init() {
    _emailController = TextEditingController();
    _emailController.addListener(_emailControllerListener);

    _firstnameController = TextEditingController();
    _firstnameController.addListener(_firstnameControllerListener);

    _lastnameController = TextEditingController();
    _lastnameController.addListener(_lastnameControllerListener);

    _passwordController = TextEditingController();
    _passwordController.addListener(_passwordControllerListener);

    _repeatPasswordController = TextEditingController();
    _repeatPasswordController.addListener(_repeatPasswordControllerListener);

    _textControllersListenerObserver =
        ValueNotifierListenersObserver<TextEditingController>(
      notifiers: [
        _emailController,
        _firstnameController,
        _lastnameController,
        _passwordController,
        _repeatPasswordController,
      ],
      generalListener: _listenButtonEnabled,
    );

    _textControllersListenerObserver.init();

    setState(() {});
  }

  void _dispose() {
    _emailController.removeListener(_emailControllerListener);
    _emailController.dispose();

    _firstnameController.removeListener(_firstnameControllerListener);
    _firstnameController.dispose();

    _lastnameController.removeListener(_lastnameControllerListener);
    _lastnameController.dispose();

    _passwordController.removeListener(_passwordControllerListener);
    _passwordController.dispose();

    _repeatPasswordController.removeListener(_repeatPasswordControllerListener);
    _repeatPasswordController.dispose();

    _textControllersListenerObserver.dispose();
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

  ///
  @override
  Widget build(BuildContext context) => BackgroundWithCircles(
        child: Scaffold(
          body: Builder(
            builder: (context) => ListView(
              padding: EdgeInsets.only(
                left: 54,
                right: 54,
                bottom: MediaQuery.of(context).padding.bottom,
              ),
              children: [
                const SizedBox(
                  height: 134,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: BackArrowButton(
                    onPressed: context.router.maybePop,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                AuthTitle(
                  text: LocaleKeys.app_auth_sign_up_title.tr(),
                ),
                const SizedBox(
                  height: 24,
                ),
                EmailInput(
                  controller: _emailController,
                  prefixIconColor: context.color.hint,
                  validation: _emailValidation,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 24,
                ),
                CommonInputField(
                  controller: _firstnameController,
                  prefixIcon: InputFieldIconWrapper(
                    assetPath: Assets.icons.iconPerson.path,
                  ),
                  hintText:
                      LocaleKeys.app_auth_sign_up_input_hint_firstname.tr(),
                  validation: _firstnameValidation,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 24,
                ),
                CommonInputField(
                  controller: _lastnameController,
                  prefixIcon: InputFieldIconWrapper(
                    assetPath: Assets.icons.iconPerson.path,
                  ),
                  hintText:
                      LocaleKeys.app_auth_sign_up_input_hint_lastname.tr(),
                  validation: _lastnameValidation,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 24,
                ),
                PasswordInput(
                  controller: _passwordController,
                  prefixIconColor: context.color.hint,
                  obscureText: !_showPassword,
                  onSuffixTap: _toggleShowPassword,
                  validation: _passwordValidation,
                  textInputAction: TextInputAction.next,
                ),
                const SizedBox(
                  height: 24,
                ),
                PasswordInput(
                  controller: _repeatPasswordController,
                  prefixIconColor: context.color.hint,
                  obscureText: !_showRepeatPassword,
                  onSuffixTap: _toggleShowRepeatPassword,
                  hint: LocaleKeys.app_auth_sign_up_input_hint_repeat_password
                      .tr(),
                  validation: _repeatPasswordValidation,
                ),
                const SizedBox(
                  height: 24,
                ),
                TermsOfUseAgreeCheckBox(
                  initialValue: _termsAgreed,
                  onPressed: _toggleTermsAgreement,
                ),
                const SizedBox(
                  height: 24,
                ),
                PrimaryButton(
                  disabled: !_buttonEnabled,
                  title: LocaleKeys.app_auth_sign_up_button_get_code.tr(),
                  onPressed: () => _onSignUpButtonPressed(context),
                ),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ),
      );
}
