library src.modules.authentication.screens.reset_password;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ResetPasswordScreen extends StatelessWidget implements AutoRouteWrapper {
  const ResetPasswordScreen({super.key});

  @override
  Widget wrappedRoute(BuildContext context) => this;

  @override
  Widget build(BuildContext context) => const _ResetPasswordScreenView();
}

class _ResetPasswordScreenView extends StatelessWidget {
  const _ResetPasswordScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
