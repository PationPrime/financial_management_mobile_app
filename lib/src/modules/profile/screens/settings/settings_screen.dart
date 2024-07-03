library src.modules.profile.screens.settings;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class SettingsScreen extends StatelessWidget implements AutoRouteWrapper {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) => const _SettingsScreenView();
}

class _SettingsScreenView extends StatelessWidget {
  const _SettingsScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
