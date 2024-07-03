library src.modules.dashboard.screens.dashboard;

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage()
class DashboardScreen extends StatelessWidget implements AutoRouteWrapper {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) => this;

  @override
  Widget wrappedRoute(BuildContext context) => const _DashboardScreenView();
}

class _DashboardScreenView extends StatelessWidget {
  const _DashboardScreenView();

  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }
}
