library src.modules.profile.screens.profile;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class ProfileScreen extends StatelessWidget implements AutoRouteWrapper {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) => const _ProfileScreenView();
}

class _ProfileScreenView extends StatelessWidget {
  const _ProfileScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
