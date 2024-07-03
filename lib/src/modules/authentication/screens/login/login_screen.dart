library src.modules.authentication.screens.login;

import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:financial_management/src/app/config/environment/environment.dart';
import 'package:financial_management/src/app/extensions/extensions.dart';
import 'package:financial_management/src/app/localization/lang/locale_keys.g.dart';
import 'package:financial_management/src/app/models/models.dart';
import 'package:financial_management/src/app/repositories/repositories.dart';
import 'package:financial_management/src/app/router/app_router.gr.dart';
import 'package:financial_management/src/app/shared_controllers/authorization_controller/authorization_controller.dart';
import 'package:financial_management/src/app/storage/storage.dart';
import 'package:financial_management/src/app/widgets/widgets.dart';
import 'package:financial_management/src/modules/authentication/components/components.dart';
import 'package:financial_management/src/modules/authentication/controllers/authentication_controller/authentication_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../app/constants/constants.dart';
import '../../../../app/tools/tools.dart';

@RoutePage()
class LoginScreen extends StatelessWidget implements AutoRouteWrapper {
  const LoginScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) =>
      BlocProvider<AuthenticationController>(
        create: (_) => AuthenticationController(
          context.read<AuthenticationRepositoryInterface>()
              as V1AuthenticationRepository,
          context.read<AuthorizationController>(),
          HiveStorage.instance,
        ),
        child: this,
      );

  @override
  Widget build(BuildContext context) => const _LoginScreenView();
}

class _LoginScreenView extends StatefulWidget {
  const _LoginScreenView();

  @override
  State<_LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<_LoginScreenView> {
  ///
  late final TextEditingController _emailController;
  late final TextEditingController _passwordController;

  ///
  late final ValueNotifierListenersObserver<TextEditingController>
      _textControllersListenerObserver;

  ///
  TextFieldValidation _emailValidation = const TextFieldValidation();
  TextFieldValidation _passwordValidation = const TextFieldValidation();

  ///
  FormValidation get _formValidation => FormValidation(
        validations: [
          _emailValidation,
          _passwordValidation,
        ],
      );

  ///
  bool _showPassword = false;

  ///
  bool _buttonEnabled = false;

  void _listenButtonEnabled() => setState(
        () => _buttonEnabled = _emailController.value.text.isNotEmpty &&
            _passwordController.value.text.isNotEmpty,
      );

  void _toggleShowPassword() => setState(
        () => _showPassword = !_showPassword,
      );

  void _validateEmail() {
    _emailValidation = _emailValidation.copyWith(
      /// Is email valid
      isValid: _emailController.text.isNotEmpty &&
          RegExpConstants.emailRegExp.hasMatch(
            _emailController.text,
          ),

      /// Email validation errors
      errors: [
        if (!RegExpConstants.emailRegExp.hasMatch(_emailController.text))
          ValidationError(
            message:
                LocaleKeys.app_auth_login_input_validation_email_invalid.tr(),
          ),
      ],
    );

    setState(() {});
  }

  void _validatePassword() {
    //todo: implements
  }

  void _validateLoginForm() {
    _validateEmail();
    _validatePassword();
  }

  void _emailControllerListener() {
    if (!_emailValidation.isValid) {
      _validateEmail();
    }
  }

  void _passwordControllerListener() {
    if (!_passwordValidation.isValid) {
      _validatePassword();
    }
  }

  final _loadingDialog = CoinSwitchLoadingDialog();

  Future<void> _onLoginButtonPressed(BuildContext context) async {
    _validateLoginForm();

    if (!_formValidation.isValid) {
      return;
    }

    context.read<AuthenticationController>().login(
          LoginCredentials(
            email: _emailController.text,
            password: _passwordController.text,
          ),
        );
  }

  void _loadingListener(
    BuildContext context,
    AuthenticationState authenticationState,
  ) =>
      authenticationState.loading
          ? _loadingDialog.show(context: context)
          : _loadingDialog.hide(context);

  bool _listenLoadingWhen(
    AuthenticationState previous,
    AuthenticationState current,
  ) =>
      previous.loading != current.loading;

  void _init() {
    _emailController = TextEditingController();
    _emailController.addListener(_emailControllerListener);

    _passwordController = TextEditingController();
    _passwordController.addListener(_passwordControllerListener);

    _textControllersListenerObserver =
        ValueNotifierListenersObserver<TextEditingController>(
      notifiers: [
        _emailController,
        _passwordController,
      ],
      generalListener: _listenButtonEnabled,
    );

    _textControllersListenerObserver.init();
  }

  void _dispose() {
    _emailController.removeListener(_emailControllerListener);
    _emailController.dispose();

    _passwordController.removeListener(_passwordControllerListener);
    _passwordController.dispose();

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

  @override
  Widget build(BuildContext context) => BackgroundWithCircles(
        child: Scaffold(
          body: BlocConsumer<AuthenticationController, AuthenticationState>(
            listenWhen: _listenLoadingWhen,
            listener: _loadingListener,
            builder: (context, state) => Stack(
              children: [
                ListView(
                  padding: EdgeInsets.only(
                    right: 54,
                    left: 54,
                    bottom: MediaQuery.of(context).padding.bottom,
                  ),
                  children: [
                    const SizedBox(
                      height: 190,
                    ),
                    AuthTitle(
                      text: LocaleKeys.app_auth_login_title.tr(),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    EmailInput(
                      prefixIconColor: context.color.hint,
                      controller: _emailController,
                      validation: _emailValidation,
                      textInputAction: TextInputAction.next,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PasswordInput(
                      prefixIconColor: context.color.hint,
                      controller: _passwordController,
                      validation: _passwordValidation,
                      obscureText: !_showPassword,
                      onSuffixTap: _toggleShowPassword,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TabbableText(
                      text:
                          LocaleKeys.app_auth_login_button_forgot_password.tr(),
                      onTap: () {},
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    PrimaryButton(
                      title: LocaleKeys.app_auth_login_button_login.tr(),
                      onPressed: () => _onLoginButtonPressed(context),
                      disabled: !_buttonEnabled,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Center(
                      child: DontHaveAnAccount(
                        onTextTap: () => context.router.push(
                          const SignUpRoute(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                  ],
                ),
                if (!AppEnvironment.instance.mainIsProd)
                  const Positioned(
                    top: 100,
                    right: 28,
                    child: EnvironmentConfigSettingsButton(),
                  )
              ],
            ),
          ),
        ),
      );
}
